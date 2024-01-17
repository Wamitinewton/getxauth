import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/pages/studentpages/controllers/avatar_controller.dart';
import 'package:test_project/services/profile_service.dart';

import '../../pages/studentpages/repository/datalayer_repo.dart';

class ProfileAvatar extends StatelessWidget {
   final AvatarController _avatarController = Get.put(
      AvatarController(ImagePickerRepositoryImpl(), ProfileStorageService()));
   ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
     _avatarController.loadProfilePhoto('wbK4jQMtrGWLld66NQmEe5vpbMq2');
    return GestureDetector(
                          onTap: () async {
                            await _avatarController.pickImage();
                          },
                          child: Obx(() => CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.black,
                              child:
                                  ClipOval(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: _avatarController.imagePath.value.isNotEmpty
                                          ? Image.network(
                                            _avatarController.imagePath.value,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                            
                                          )
                                          : const Icon(
                                              Icons.account_circle,
                                              size: 70,
                                              color: Colors.white,
                                            ),
                                    ),
                                  ))),
                        );
  }
}
