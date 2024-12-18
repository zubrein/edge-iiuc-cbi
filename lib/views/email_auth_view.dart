import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/email_auth_controller.dart';

class EmailAuthView extends StatelessWidget {
  final EmailAuthController controller = Get.put(EmailAuthController());

  EmailAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Email Authentication")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            children: [
              TextField(
                onChanged: (value) => controller.email.value = value,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                onChanged: (value) => controller.password.value = value,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              if (controller.isLoading.value)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: controller.signUp,
                  child: const Text("Sign Up"),
                ),
                ElevatedButton(
                  onPressed: controller.signIn,
                  child: const Text("Sign In"),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
