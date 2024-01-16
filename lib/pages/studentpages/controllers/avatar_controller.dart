import 'package:get/get.dart';
import 'package:test_project/pages/studentpages/repository/image_repo.dart';

class AvatarController extends GetxController {
  final ImagePickerRepository _imagePickerRepository;

  AvatarController(this._imagePickerRepository);

  final RxString imagePath = ''.obs;
  Future<void> pickImage() async {
    final String? pickedImagePath = await _imagePickerRepository.pickImage();
    if (pickedImagePath != null) {
      imagePath.value = pickedImagePath;
    }
  }
}