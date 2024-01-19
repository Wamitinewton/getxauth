import 'package:get/get.dart';
import 'package:igniteiq/Authentication%20pages/authcontrollers/auth_service.dart';
import 'package:igniteiq/Authentication%20pages/authcontrollers/phone_service.dart';
import 'package:igniteiq/pages/teacherpages/controllers/video_upload.dart';
import 'package:igniteiq/services/course_controller.dart';
import 'package:igniteiq/services/profile_service.dart';

import '../pages/studentpages/controllers/avatar_controller.dart';
import '../pages/studentpages/controllers/navbar_controller.dart';
import '../pages/studentpages/repository/datalayer_repo.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());

    Get.put<CourseController>(CourseController());

    Get.put<PhoneAuthController>(PhoneAuthController());

    Get.put<UploadController>(UploadController());
    Get.put(
        AvatarController(ImagePickerRepositoryImpl(), ProfileStorageService()));
    Get.put(NavBarController());
  }
}
