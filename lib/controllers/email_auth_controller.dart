import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EmailAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  void signUp() async {
    isLoading.value = true;

  }

  void signIn() async {
    isLoading.value = true;

  }
}
