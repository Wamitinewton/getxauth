
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxString username = ''.obs;

  RxBool isLoading = false.obs;

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

  void setUsername(String value) {
    username.value = value;
  }

  Future<void> signUp(String email, String password, String username,
      String confirmPassword) async {
    String? emailError = validateEmail(email);
    String? passwordError = validatePassword(password);

    if (emailError == null && passwordError == null) {
      if (passwordController.text == confirmPasswordController.text) {
        try {
          Get.dialog(
              const Center(
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    )),
              ),
              barrierDismissible: false);
          UserCredential result = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);

          user.value = result.user;
          Get.back();
         
          Get.back();

          Get.toNamed('/welcome');
        } catch (e) {
          Get.snackbar('Error', 'An unexpected error occurred');
        }
      } else {
        Get.dialog(
          AlertDialog(
            title: const Text('Alert'),
            content: const Text('Your passwords do not match'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
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
            const Center(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  )),
            ),
            barrierDismissible: false);
        UserCredential result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        user.value = result.user;
        Get.back();

        Get.toNamed('/welcome');
      } catch (e) {
        Get.back();
        Get.snackbar('Error', 'Invalid log in credentials. Please try again');
      }
    } else {
      Get.back();
      Get.snackbar('Error', 'Invalid email or password');
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    user.value = null;
  }
}
