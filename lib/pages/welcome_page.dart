import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Authentication%20pages/auth_service.dart';
import 'package:test_project/services/expandable_controller.dart';

class WelcomePage extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final ExpandableTextController _expandableTextController =
      Get.put(ExpandableTextController());
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 109, 175, 230),
      body: Stack(children: [
        Container(
          height: 400,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/elearning-ecdl-akadimos.jpg'),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350, left: 50),
          child: Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.teal,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                 
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
                    padding: EdgeInsets.all(14.0),
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
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Student',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Or'),
                  SizedBox(
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
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120, right: 120, bottom: 50),
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
                        width: 10,
                      ),
                      Text('Log Out'),
                    ],
                  ),
                ),
              ),
                    ]
                
              ),
            ),
          ),
        ),
        ]),
    );
  }
}
