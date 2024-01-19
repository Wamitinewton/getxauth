import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


import '../../models/usermodel/user_model.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
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

  Future<void> signUp(
    String email,
    String password,
    String username,
    String confirmPassword,
  ) async {
    try {
      EasyLoading.show(
          indicator: const CircularProgressIndicator(),
          maskType: EasyLoadingMaskType.clear,
          status: "Authenticating...",
          dismissOnTap: true);

      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

     
      UserModel user = UserModel(
        name: usernameController.text,
        id: result.user!.uid,
        email: emailController.text,
    
        avatar: "",
        bio: "",
        link: "",
        followers: [],
        following: [],
       
      );

      await _db.collection("Users").doc(result.user!.uid).set(user.toJson());
      EasyLoading.dismiss();
      EasyLoading.addStatusCallback(
         (_){
          EasyLoading.show(
             indicator: const Icon(
            Icons.check,
            color: Colors.blue,
          ),
          status: "Authenticated",
          dismissOnTap: true,
          );
         }
          );
      EasyLoading.dismiss();
      Future.delayed(const Duration(seconds: 1),(){
         Get.offAllNamed("/welcome");
      });
     
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message!);

      // handleFirebaseAuthError(e);
    } catch (e) {
      EasyLoading.showError(e.toString());
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
              backgroundColor: Colors.blue, colorText: Colors.white);
          break;
        case 'user-not-found':
          Get.snackbar(
              'Error', 'User not found. Please check your credentials.',
              backgroundColor: Colors.blue, colorText: Colors.white);
          break;
        case 'wrong-password':
          Get.snackbar('Error', 'Invalid password. Please try again.',
              backgroundColor: Colors.blue, colorText: Colors.white);
          break;
        default:
          Get.snackbar('Error', 'An unexpected authentication error occurred',
              backgroundColor: Colors.blue, colorText: Colors.white);
      }
    } else {
      Get.snackbar('Error', 'An unexpected error occurred',
          backgroundColor: Colors.blue, colorText: Colors.white);
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    user.value = null;
  }
}
