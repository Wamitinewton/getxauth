import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_project/Authentication%20pages/authcontrollers/auth_service.dart';
import 'package:test_project/models/course_model.dart';

import 'package:test_project/services/course_controller.dart';

class HomeScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final CourseController _courseController = Get.find<CourseController>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zindua learners'),
        actions: [
          IconButton(
              onPressed: () {
                _authController.logOut();
                Get.offAllNamed('/login');
              },
              
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(''),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add a New Course',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: () async {
                  // ignore: non_constant_identifier_names
                  try {
                    // ignore: non_constant_identifier_names
                    final PickedFile = await _imagePicker.pickVideo(
                        source: ImageSource.gallery);
                    if (PickedFile != null) {
                      File videoFile = File(PickedFile.path);

                      Course newCourse = Course(
                          id: '',
                          title: _titleController.text,
                          description: _descriptionController.text,
                          videoUrl: '',
                          uploaderId: '');
                      _courseController.addCourse(newCourse, videoFile);

                      _titleController.clear();
                      _descriptionController.clear();

                      _courseController.loadCourses();
                      Get.toNamed('/course/${newCourse.id}');
                    }
                  } catch (e) {
                    Get.snackbar('Error', 'Failed to add course');
                  }
                }, child: Obx(() {
                  return _courseController.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Add course');
                })),
                Obx(() {
                  if (_courseController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (_courseController.courses.isEmpty) {
                    return const Center(
                      child: Text('You have not added any course yet'),
                    );
                  } else {
                    return Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _courseController.courses.length,
                          itemBuilder: (context, index) {
                            Course course = _courseController.courses[index];
                            return ListTile(
                              title: Text(course.title),
                              subtitle: Text(course.description),
                              onTap: () {
                                Get.toNamed('/course/${course.id}');
                              },
                            );
                          }),
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
