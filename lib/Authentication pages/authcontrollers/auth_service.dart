import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Authentication%20pages/otpVerification/verification_screen.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;
  late String phoneNumber ;

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
 
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    isLoading.value = true;
    this.phoneNumber = phoneNumber;
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          isLoading.value = false;
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', e.toString());
          isLoading.value = false;
        },
        codeSent: ((String verificationId, int? resendToken) {
          Get.to(() =>   OtpVerificationScreen(verificationId: ''));
          isLoading.value = false;
        }),
        codeAutoRetrievalTimeout: (String verificationId) {
          Get.snackbar('Time', 'Auto retrieval timeout');
          isLoading.value = false;
        });
  }

  Future<void> verifyOtp(
      String verificationId, String otp, String phoneNumber) async {
    isLoading.value = true;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await _auth.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
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
                child: Padding(
                  padding: EdgeInsets.all(200.0),
                  child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      )),
                ),
              ),
              barrierDismissible: false);
          UserCredential result = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);

          user.value = result.user;
          Get.back();

          Get.toNamed('/welcome');
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
            const Center(
              child: Padding(
                padding: EdgeInsets.all(200.0),
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    )),
              ),
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
      Get.snackbar('Error', 'Invalid email or password');
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    user.value = null;
  }
}
