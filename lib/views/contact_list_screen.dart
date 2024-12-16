import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import 'edit_contact_screen.dart';

class ContactListScreen extends StatelessWidget {
  final ContactController contactController = Get.put(ContactController());

  ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: Obx(() {
        if (contactController.contactList.isEmpty) {
          return const Center(child: Text('No contacts available.'));
        }
        return ListView.builder(
          itemCount: contactController.contactList.length,
          itemBuilder: (context, index) {
            final contact = contactController.contactList[index];
            return ListTile(
              title: Text(contact.name),
              subtitle: Text('${contact.email}\n${contact.phone}'),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () =>
                        Get.to(() => EditContactScreen(contact: contact)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        contactController.deleteContact(contact.id),
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(() => EditContactScreen(contact: null)),
      ),
    );
  }
}
