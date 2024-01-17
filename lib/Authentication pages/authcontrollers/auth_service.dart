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
    try {
      String? emailError = validateEmail(email);
      String? passwordError = validatePassword(password);

      if (emailError == null && passwordError == null) {
        if (passwordController.text == confirmPasswordController.text) {
          Get.dialog(
              const Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ),
              barrierDismissible: false);

          UserCredential result = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          user.value = result.user;
          Get.back();

          Get.toNamed('/welcome');
        } else {
          Get.back();
          Get.dialog(AlertDialog(
            title: const Text('Alert'),
            content: const Text('Your passwors do not match'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Ok'),
              ),
            ],
          ));
        }
      } else {
        Get.back();
        Get.snackbar('Error', 'Invalid email or password',
            snackPosition:
                SnackPosition.TOP, 
            snackStyle: SnackStyle.FLOATING,
            backgroundColor: Colors.blue, 
            colorText: Colors.white);
      }
    } catch (e) {
      handleFirebaseAuthError(e);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      String? emailError = validateEmail(email);
      String? passwordError = validatePassword(password);

      if (emailError == null && passwordError == null) {
        Get.dialog(
            const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ),
            barrierDismissible: false);

        UserCredential result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        user.value = result.user;

        Get.back();
        Get.toNamed('/welcome');
      } else {
        Get.back();
        Get.snackbar('Error', 'Invalid email or password',
            snackPosition: SnackPosition.TOP,
            snackStyle: SnackStyle.FLOATING,
            backgroundColor: Colors.blue,
            colorText: Colors.white);
      }
    } catch (e) {
      handleFirebaseAuthError(e);
    }
  }

  void handleFirebaseAuthError(dynamic error) {
    Get.until((route) => Get.isDialogOpen == false);
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'network-request-failed':
          Get.snackbar('Error', 'Network error. Please check your connection.',
              
              backgroundColor: Colors.blue,
              colorText: Colors.white);
          break;
        case 'user-not-found':
          Get.snackbar(
              'Error', 'User not found. Please check your credentials.',
             
              backgroundColor: Colors.blue,
              colorText: Colors.white);
          break;
        case 'wrong-password':
          Get.snackbar('Error', 'Invalid password. Please try again.',
             
              backgroundColor: Colors.blue,
              colorText: Colors.white);
          break;
        default:
          Get.snackbar('Error', 'An unexpected authentication error occurred',
             
              backgroundColor: Colors.blue,
              colorText: Colors.white);
      }
    } else {
      Get.snackbar('Error', 'An unexpected error occurred',
          
          backgroundColor: Colors.blue,
          colorText: Colors.white);
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    user.value = null;
  }
}
