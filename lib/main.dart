import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Authentication%20pages/auth_service.dart';
import 'package:test_project/Authentication%20pages/signup_page.dart';
import 'package:test_project/pages/home_screen.dart';
import 'package:test_project/services/course_controller.dart';

import 'Authentication pages/log_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDcWrbr5U63f7fL5hLVAraZtzieYut2WZ8', 
    appId: '1:680430795953:android:80bfcb84f67ce857287690', 
    messagingSenderId: '680430795953', 
    projectId: 'getxauth-e3681',
    storageBucket: "getxauth-e3681.appspot.com",
    ),
  );

  Get.put(AuthController());
  Get.put(CourseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  GetMaterialApp(
     debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        
      }),
      

      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LogInScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/homescreen', page: () => HomeScreen()),
        // GetPage(name: '/verify', page: () => VerificationScreen()),
        ],
      // home: HomeScreen(),
      
    );
  }
}

