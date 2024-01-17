import 'dart:io';

import 'package:get/get.dart';
import 'package:test_project/pages/studentpages/repository/image_repo.dart';
import 'package:test_project/services/profile_service.dart';

class AvatarController extends GetxController {
  final ImagePickerRepository _imagePickerRepository;
  final ProfileStorageService _storageService;

  AvatarController(this._imagePickerRepository, this._storageService);

  final RxString imagePath = ''.obs;
  Future<void> pickImage() async {
    final String? pickedImagePath = await _imagePickerRepository.pickImage();
    if (pickedImagePath != null) {
      imagePath.value = pickedImagePath;
      await _storageService.uploadProfilePhoto(
          File(pickedImagePath), 'wbK4jQMtrGWLld66NQmEe5vpbMq2');
    }
  }

  Future<void> loadProfilePhoto(String userId) async {
    final String? photoURL = await _storageService.getProfilePhotoURL(userId);
    if (photoURL != null) {
      imagePath.value = photoURL;
    }
  }
}
