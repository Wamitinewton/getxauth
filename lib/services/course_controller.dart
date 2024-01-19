import 'dart:io';

import 'package:get/get.dart';
import 'package:igniteiq/models/course%20model/course_model.dart';
import 'package:igniteiq/services/firebase_learnservice.dart';
class CourseController extends GetxController {
  final FirebaseService _firebaseService = Get.put(FirebaseService());
  final RxList<Course> courses = <Course>[].obs;
  final RxBool isLoading = true.obs;
  final RxList<Course> filteredCourses = <Course>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCourses();
  }

  void filterCourses(String query) {
    if (query.isEmpty) {
      filteredCourses.assignAll(courses);
    } else {
      final filteredList = courses
          .where((course) =>
              course.title.toLowerCase().contains(query.toLowerCase()) ||
              course.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
      filteredCourses.assignAll(filteredList);
    }
  }

  void loadCourses() async {
    try {
      isLoading.value = true;
      final coursesData = _firebaseService.getCourses();
      courses.assignAll(coursesData as Iterable<Course>);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load courses');
    } finally {
      isLoading.value = false;
    }
  }

   addCourse(Course course, File videoFile) async {
    try {
      isLoading.value = true;
      await _firebaseService.addCourse(course, videoFile);
      loadCourses();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add course');
    } finally {
      isLoading.value = false;
    }
  }
}
