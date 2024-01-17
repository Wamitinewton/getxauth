import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:get/get.dart';

class ProfileStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadProfilePhoto(File file, String userId) async {
    try {
      final Reference storageRef =
          _storage.ref().child('profile_photos/$userId.jpg');
      await storageRef.putFile(file);
      final String downloadURL = await storageRef.getDownloadURL();
      return downloadURL;
    } catch (e) {
      Get.snackbar('Error', 'Error when uploading profile photo');
      return null;
    }
  }

  Future<String?> getProfilePhotoURL(String userId) async {
    try {
     
      final Reference storageRef =
          _storage.ref().child('profile_photos/$userId.jpg');
      return await storageRef.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Error trying to fetch your profile photo');
      return null;
    }
  }
}
