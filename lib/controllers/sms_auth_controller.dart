import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SMSAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var phoneNumber = ''.obs;
  var verificationId = ''.obs;
  var smsCode = ''.obs;
  var isLoading = false.obs;

  void verifyPhone() async {
    isLoading.value = true;
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber.value,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-sign in
          await _auth.signInWithCredential(credential);
          Get.snackbar("Success", "User signed in automatically!");
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar("Error", e.message ?? "Verification failed.");
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId.value = verificationId;
          Get.snackbar(
              "Code Sent", "Verification code sent to ${phoneNumber.value}");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } finally {
      isLoading.value = false;
    }
  }

  void signInWithSMSCode() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: smsCode.value,
      );
      await _auth.signInWithCredential(credential);
      Get.snackbar("Success", "User signed in with SMS code!");
    } catch (e) {
      print("Error" + e.toString());
      Get.snackbar("Error", e.toString());
    }
  }
}
