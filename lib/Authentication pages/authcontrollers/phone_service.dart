
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PhoneAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  Future<bool> verifyPhoneNumber(String phoneNumber) async {
    try {
      isLoading(true);

    await _auth.verifyPhoneNumber(

      phoneNumber: phoneNumber,
      
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        isLoading(false);
      } ,
      
      verificationFailed:  (FirebaseAuthException e) {
        Get.snackbar('Error', 'Verification failed : ${e.message}');
        isLoading(false);
      },
      
      codeSent: (String verificationId, int? resendToken) {
        isLoading(false);
        Get.toNamed('/otp');
      },
      
      codeAutoRetrievalTimeout: (String verificationId) {
        

        isLoading(false);
        Get.toNamed('/otp');
      });
      
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
      return false;
  }

  Future<void> verifyOTP(String verificationId, String otp) async {
    try {
      isLoading(true);

      AuthCredential credential = PhoneAuthProvider.credential(
        
        verificationId: verificationId, 
        
        smsCode: otp,
        
        );

        await _auth.signInWithCredential(credential);
        isLoading(false);
        Get.offAllNamed('homescreen');
    } catch (e) {
      Get.snackbar('Error', 'Error while verifying otp: $e');
      isLoading(false);
    }
  }
}
