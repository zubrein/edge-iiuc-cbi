import 'package:get/get.dart';

class SMSAuthController extends GetxController {
  var phoneNumber = ''.obs;
  var verificationId = ''.obs;
  var smsCode = ''.obs;
  var isLoading = false.obs;

  void verifyPhone() async {
    isLoading.value = true;
  }

  void signInWithSMSCode() async {}
}
