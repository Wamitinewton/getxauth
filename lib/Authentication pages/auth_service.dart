import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/pages/home_screen.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your password';
    }
    return null;
  }

  Future<void> signUp(String email, String password, String username,
      String confirmPassword) async {
    String? emailError = validateEmail(email);
    String? passwordError = validatePassword(password);

    if (emailError == null && passwordError == null) {
      if (passwordController.text == confirmPasswordController.text) {
        try {
          Get.dialog(
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(200.0),
                  child: Container(
                      width: 40,
                      height: 40,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      )),
                ),
              ),
              barrierDismissible: false);
          UserCredential result = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);

          user.value = result.user;
          Get.back();

          Get.offAll(HomeScreen());
        } catch (e) {
          Get.back();
          Get.snackbar(
              'Error', 'Invalid Email or password. Please check and try again');
        }
      } else {
        Get.snackbar('Error', 'Passwords do not match.');
      }
    } else {
      Get.snackbar('Error', 'Invalid email or password');
    }
  }

  Future<void> signIn(String email, String password) async {
    String? emailError = validateEmail(email);
    String? passwordError = validatePassword(password);

    if (emailError == null && passwordError == null) {
      try {
        Get.dialog(
            Center(
              child: Padding(
                padding: const EdgeInsets.all(200.0),
                child: Container(
                    width: 40,
                    height: 40,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    )),
              ),
            ),
            barrierDismissible: false);
        UserCredential result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        user.value = result.user;
        Get.back();

        Get.offAll(HomeScreen());
      } catch (e) {
        Get.back();
        Get.snackbar('Error', 'Invalid log in credentials. Please try again');
      }
    } else {
      Get.snackbar('Error', 'Invalid email or password');
    }
  }
// Future <void> sendEmailVerification() async {
//   try {
//     User? currentUser = _auth.currentUser;
//     await currentUser?.sendEmailVerification();

//     Get.snackbar('Verification Email Sent', 'Check your Email to verify your account');
//   } catch (e) {
//     if (kDebugMode) {
//       print('Error sending verification email : $e');
//     }
//     Get.snackbar('Error', 'Failed to send verification email.');
//   }
// }
  Future<void> logOut() async {
    await _auth.signOut();
    user.value = null;
  }

  
}
