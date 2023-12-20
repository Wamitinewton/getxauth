import 'dart:io';

import 'package:get/get.dart';
import 'package:test_project/models/course_model.dart';
import 'package:test_project/services/firebase_learnservice.dart';

class CourseController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  final RxList<Course> courses = <Course>[].obs;

  @override
  void onInit(){
    super.onInit();
    loadCourses();
  }

  void loadCourses() {
    _firebaseService.getCourses().listen((coursesData) {
      courses.assignAll(coursesData);
     });
  }

  void addCourse(Course course, File videoFile) {
    _firebaseService.addCourse(course, videoFile);
  }
}