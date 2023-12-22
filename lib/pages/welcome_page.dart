import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/services/expandable_controller.dart';

class WelcomePage extends StatelessWidget {
  final ExpandableTextController _expandableTextController =
      Get.put(ExpandableTextController());
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 270,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/elearning-ecdl-akadimos.jpg'),
                    fit: BoxFit.cover)),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Welcome To Zindua E-Learning application",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Are you a student or a teacher? This is the place to be.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
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
              firstChild: const Text('See more about us below by pressing the icon above', style: TextStyle(
                color: Colors.amber,
                fontSize: 14,
              ),),
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
                child: Text('Sign in as a :', style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  
                ),),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, 
                  child: const Text('Student', style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),),),
SizedBox(width: 30,),
                  

                  ElevatedButton(onPressed: () {
                    Get.toNamed('/homescreen');
                  }, 
                  child: const Text('Teacher', style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),),)
                ],
              )
        ],
      ),
    );
  }
}
