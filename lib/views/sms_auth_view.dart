import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sms_auth_controller.dart';

class SMSAuthView extends StatelessWidget {
  final SMSAuthController controller = Get.put(SMSAuthController());

  SMSAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SMS Authentication")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            children: [
              TextField(
                onChanged: (value) => controller.phoneNumber.value = value,
                decoration: const InputDecoration(labelText: "Phone Number"),
              ),
              if (controller.isLoading.value)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: controller.verifyPhone,
                  child: const Text("Verify Phone"),
                ),
              TextField(
                onChanged: (value) => controller.smsCode.value = value,
                decoration: const InputDecoration(labelText: "SMS Code"),
              ),
              ElevatedButton(
                onPressed: controller.signInWithSMSCode,
                child: const Text("Sign in with SMS Code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
