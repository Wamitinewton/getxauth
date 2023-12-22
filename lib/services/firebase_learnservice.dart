import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:test_project/models/course_model.dart';

class FirebaseService {
  final CollectionReference _coursesCollection =
      FirebaseFirestore.instance.collection('courses');
  final Reference _storageReference = FirebaseStorage.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addCourse(Course course, File videoFile) async {
   try {
     User? user = _auth.currentUser;
     if (user == null) {
       throw Exception("User has not been authenticated");
     }
      final videoRef = _storageReference.child('videos/${course.id}.mp4');
    await videoRef.putFile(videoFile);

    final String videoUrl = await videoRef.getDownloadURL();

    await _coursesCollection.add({
      'title': course.title,
      'description': course.description,
      'videoUrl': videoUrl,
      'uploaderId': user.uid,
    });
   } catch (e) {
     Get.snackbar('Error', 'Error trying to add course');
     throw Exception("Unable to add a course");
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

  Future <File> getVideoFile (String courseId) async {
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

      File videoFile =File('/path/to/store/videos/${courseId}.mp4');
      await _storageReference.child('videos/$courseId.mp4').writeToFile(videoFile);
      return videoFile;
    } catch (e) {
      throw Exception("Error trying to retrieve video!");
    }
    
  }
}
