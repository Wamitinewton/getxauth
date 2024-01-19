import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igniteiq/models/course%20model/course_model.dart';


class FirebaseService {
  final CollectionReference _coursesCollection =
      FirebaseFirestore.instance.collection('courses');
  final Reference _storageReference = FirebaseStorage.instance.ref('getxauth-e3681.appspot.com');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  Future<void> addCourse(Course course, File videoFile) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        throw Exception("User has not been authenticated");
      } else if (_descriptionController.text.isEmpty &&
          _titleController.text.isEmpty) {
        Get.defaultDialog(
          title: 'Alert!',
          middleText: 'please fill up the provided fields!.',
          backgroundColor: Colors.white,
          titleStyle: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          middleTextStyle: const TextStyle(
            color: Colors.black,
          ),
          confirm: ElevatedButton(
            onPressed: () {
              Get.toNamed('/homescreen');
            },
            child: const Text('OK'),
          ),
        );
      } else {
        final videoRef = _storageReference.child('videos/${course.id}.mp4');
        final TaskSnapshot uploadTask = await videoRef.putFile(videoFile);

        final String videoUrl = await uploadTask.ref.getDownloadURL();

        await _coursesCollection.add({
          'title': course.title,
          'description': course.description,
          'videoUrl': videoUrl,
          'uploaderId': user.uid,
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Error trying to add course');
      throw Exception('Unable to add a course');
    }
  }

  Stream<List<Course>> getCourses() {
    return _coursesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Course(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          videoUrl: doc['videoUrl'],
          uploaderId: doc['uploaderId'],
        );
      }).toList();
    });
  }

  Future<File> getVideoFile(String courseId) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        throw Exception("User has not been authenticated");
      }

      DocumentSnapshot courseDoc = await _coursesCollection.doc(courseId).get();
      String uploaderId = courseDoc['uploaderId'];
      if (uploaderId != user.uid) {
        throw Exception("Unauthorized access to this video");
      }

      File videoFile = File('gs://getxauth-e3681.appspot.com $courseId.mp4');
      await _storageReference
          .child('videos/$courseId.mp4')
          .writeToFile(videoFile);
      return videoFile;
    } catch (e) {
      throw Exception("Error trying to retrieve video!");
    }
  }
}
