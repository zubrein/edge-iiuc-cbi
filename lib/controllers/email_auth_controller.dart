import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  void signUp() async {
    isLoading.value = true;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.snackbar("Success", "User signed up successfully!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void signIn() async {
    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.snackbar("Success", "User signed in successfully!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
