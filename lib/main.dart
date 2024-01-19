import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:igniteiq/Authentication%20pages/otpVerification/phonenumber_input.dart';
import 'package:igniteiq/Authentication%20pages/otpVerification/verification_screen.dart';
import 'package:igniteiq/bindings/controller_binding.dart';
import 'package:igniteiq/common/components/startup_page.dart';
import 'package:igniteiq/pages/studentpages/views/student_screen.dart';

import 'Authentication pages/authpages/log_in.dart';
import 'Authentication pages/authpages/signup_page.dart';
import 'pages/studentpages/views/dashboard_page.dart';
import 'pages/studentpages/views/mycourses_page.dart';
import 'pages/studentpages/views/profile_page.dart';
import 'pages/studentpages/views/settings_page.dart';
import 'pages/teacherpages/view/course_detailteacher.dart';
import 'pages/teacherpages/view/home_screen.dart';
import 'common/components/welcome_page.dart';
const String defaultConfigFile = 'flutter_launcher_icons.yaml';
const String flavorConfigFilePattern = r'^flutter_launcher_icons-(.*).yaml$';

Future<void> main() async {
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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinding(),
      initialRoute: '/startup',
      getPages: [
        // Replace with your actual pages
        GetPage(name: '/dashboard', page: () => const DashboardPage()),
        GetPage(name: '/my_courses', page: () => const MyCourses()),
        GetPage(name: '/profile', page: () => const ProfilePage()),
        GetPage(name: '/settings', page: () => const SettingsPage()),
        GetPage(name: '/student', page: () => StudentHomeScreen()),
        GetPage(name: '/otp', page: () => OtpVerificationScreen()),
        GetPage(name: '/phone', page: () => PhoneNumberInput()),
        GetPage(name: '/startup', page: () => const StartUPPage()),
        GetPage(name: '/welcome', page: () => WelcomePage()),
        GetPage(name: '/login', page: () => LogInScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/homescreen', page: () => HomeScreen()),
        GetPage(name: '/course/:id', page: () => const TeacherCourseDetails())
        // GetPage(name: '/verify', page: () => VerificationScreen()),
      ],
      // home: StudentHomeScreen(),
    );
  }
}
