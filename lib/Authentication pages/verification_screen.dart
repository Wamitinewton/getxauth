// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// import 'package:test_project/Authentication%20pages/auth_service.dart';


// class VerificationScreen extends StatelessWidget {
//   final AuthController _authController = Get.find<AuthController>();

//    VerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Email Verification'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('An email has been sent to ${_authController.emailController.text}.'),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 await _authController.sendEmailVerification();
//               },
//               child: const Text('Check Verification'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
