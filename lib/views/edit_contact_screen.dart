import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import '../models/contact.dart';

class EditContactScreen extends StatelessWidget {
  final ContactController contactController = Get.find();

  final Contact? contact;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  EditContactScreen({super.key, this.contact}) {
    if (contact != null) {
      nameController.text = contact!.name;
      emailController.text = contact!.email;
      phoneController.text = contact!.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact == null ? 'Add Contact' : 'Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (contact == null) {
                  // Add new contact
                  contactController.addContact(Contact(
                    id: '', // Firebase will auto-generate the ID
                    name: nameController.text.trim(),
                    email: emailController.text.trim(),
                    phone: phoneController.text.trim(),
                  ));
                } else {
                  // Update existing contact
                  contactController.updateContact(Contact(
                    id: contact!.id,
                    name: nameController.text.trim(),
                    email: emailController.text.trim(),
                    phone: phoneController.text.trim(),
                  ));
                }
                Get.back();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
