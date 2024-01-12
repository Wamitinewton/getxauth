import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_project/services/firebase_learnservice.dart';
import 'package:test_project/models/course%20model/course_model.dart';

import '../../../services/course_controller.dart';


class UploadController extends GetxController{
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final FirebaseService firebaseService = FirebaseService();
  final CourseController _courseController = Get.find<CourseController>();
  final ImagePicker _imagePicker = ImagePicker();

  Future <void> pickVideo() async {
    
    final pickedFile = await _imagePicker.pickVideo(
                        source: ImageSource.gallery);
                    if (pickedFile != null) {
                      File videoFile = File(pickedFile.path);

                      Course newCourse = Course(
                          id: '',
                          title: _titleController.text,
                          description: _descriptionController.text,
                          videoUrl: '',
                          uploaderId: '');

                          try {
                            await firebaseService.addCourse(newCourse, videoFile);
                            Get.snackbar('Success', 'Video uploaded successfully');
                          } catch (e) {
                            Get.snackbar('Error', 'Error uploading video');
                          }

                           _titleController.clear();
                      _descriptionController.clear();

                      _courseController.loadCourses();
                     
                      
                    }
  }

}