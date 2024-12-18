import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'email_auth_view.dart';
import 'sms_auth_view.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Auth")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(() => SMSAuthView()),
              child: const Text("SMS Authentication"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => EmailAuthView()),
              child: const Text("Email Authentication"),
            ),
          ],
        ),
      ),
    );
  }
}
