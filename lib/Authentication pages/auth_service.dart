import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  String? validateEmail(String? value) {
    if(value == null || value.isEmpty) {
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

  

  Future<void> signUp(String email, String password, String username , String confirmPassword) async {
    String? emailError = validateEmail(email);
    String? passwordError = validatePassword(password) ;

    if (emailError ==null && passwordError == null) {
      if (password == confirmPassword) {
        try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        
        email: email, 
        password: password
        );
        user.value = result.user;
    } catch (e) {
      Get.snackbar('Error', e.toString());
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
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
        );
        user.value = result.user;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    }else {
      Get.snackbar('Error', 'Invalid email or password');
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    user.value = null;
  }
}
