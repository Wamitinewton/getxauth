import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Authentication%20pages/authcontrollers/auth_service.dart';
import 'package:test_project/services/expandable_controller.dart';

class WelcomePage extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final ExpandableTextController _expandableTextController =
      Get.put(ExpandableTextController());
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 300,
              width: double.maxFinite,
              decoration:  BoxDecoration(
                border: Border.all(
                  color: Colors.blue
                ),
                 
                  image: const DecorationImage(
                      image:
                          AssetImage('assets/icons/person4.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350, left: 15, right: 15, bottom: 15),
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "Are you a student or a teacher? This is the place to be.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _expandableTextController.isExpanded.toggle();
                    },
                    icon: Icon(_expandableTextController.isExpanded.value
                        ? Icons.expand_less
                        : Icons.expand_more),
                  ),
                  Obx(() => AnimatedCrossFade(
                      firstChild: const Text(
                        'See more about us below by pressing the icon above',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                        ),
                      ),
                      secondChild: const Padding(
                        padding: EdgeInsets.only(left: 18, right: 18, top: 10),
                        child: Text(
                            'Embark on a journey of knowledge and discovery with our cutting-edge E-Learning application. Elevate your learning experience as you explore a vast array of courses designed to inspire, educate, and empower. From engaging video lectures to interactive quizzes, our platform provides a seamless and personalized learning environment. Unlock your full potential, gain new skills, and embrace a future of continuous learning. Your educational adventure begins here, where knowledge meets innovation, and learning knows no bounds.'),
                      ),
                      crossFadeState: _expandableTextController.isExpanded.value
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300))),
                  const SizedBox(
                    height: 25,
                  ),
                  const Center(
                    child: Text(
                      'Who are you?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/student');
                        },
                        child: const Text(
                          'Student',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text('Or'),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/homescreen');
                        },
                        child: const Text(
                          'Teacher',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 90, right: 90, bottom: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        _authController.logOut();
                        Get.toNamed('/login');
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back),
                          SizedBox(
                            width: 7,
                          ),
                          Text('Log Out'),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
