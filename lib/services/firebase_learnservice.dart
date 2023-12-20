import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:test_project/models/course_model.dart';

class FirebaseService {
  final CollectionReference _coursesCollection =
      FirebaseFirestore.instance.collection('courses');
  final Reference _storageReference = FirebaseStorage.instance.ref();

  Future<void> addCourse(Course course, File videoFile) async {
    final videoRef = _storageReference.child('videos/${course.id}.mp4');
    await videoRef.putFile(videoFile);

    final String videoUrl = await videoRef.getDownloadURL();

    await _coursesCollection.add({
      'title': course.title,
      'description': course.description,
      'videoUrl': videoUrl,
    });
  }

  Stream<List<Course>> getCourses() {
    return _coursesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Course(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          videoUrl: doc['videoUrl'],
        );
      }).toList();
    });
  }
}
