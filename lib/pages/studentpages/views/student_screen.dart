import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/pages/studentpages/controllers/avatar_controller.dart';
import 'package:test_project/pages/studentpages/repository/datalayer_repo.dart';

// ignore: must_be_immutable
class StudentHomeScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final AvatarController _avatarController = Get.put(AvatarController(ImagePickerRepositoryImpl()));

  StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 135, 231, 138),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hello Student',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          color: Colors.blue,
                          fontStyle: FontStyle.italic),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await _avatarController.pickImage();
                          },
                          child: Obx(() => CircleAvatar(
                                radius: 40,
                                backgroundImage: _avatarController
                                        .imagePath.value.isNotEmpty
                                    ? FileImage(
                                        File(_avatarController.imagePath.value))
                                    : null,
                              )),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.notifications_rounded,
                          size: 35,
                          color: Colors.purple,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 328,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.4),
                      child: Image.asset(
                        'assets/icons/person1.png',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
