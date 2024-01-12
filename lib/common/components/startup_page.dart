import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartUPPage extends StatelessWidget {
  const StartUPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Icon(
            Icons.school,
            size: 250,
            color: Colors.green,
          )),
          const SizedBox(
            height: 15,
          ),
          const Text('Let\'s get started', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.all(15),
            height: 200,
            width: 470,
            decoration: BoxDecoration(
                // color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 2.3)),
            child: const Center(
              child: Text(
                'Welcome to Zindua Learning, your gateway to a world of knowledge and growth! Embark on a journey of lifelong learning with our innovative E-learning platform. Whether you\'re a student, professional, or lifelong learner, Zindua Learning is designed to ignite your curiosity and empower you with skills for success. Dive into engaging courses, connect with passionate educators, and chart your path to personal and professional excellence. Let\'s inspire, discover, and learn together at Zindua Learning!',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            ),
            onPressed: () {
            Get.toNamed('/login');
          }, child: const Text('Get Started', style: TextStyle(
            fontSize: 18,
          ),))
        ],
      ),
    );
  }
}
