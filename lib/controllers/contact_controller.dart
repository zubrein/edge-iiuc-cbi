import 'package:get/get.dart';

import '../models/contact.dart';
import '../service/firebase_service.dart';

class ContactController extends GetxController {
  final FirebaseService _firebaseHelper = FirebaseService();

  // Observables
  var contactList = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  // Fetch contacts using FirebaseHelper
  void fetchContacts() {
    _firebaseHelper.getContactsRef().onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        contactList.value = data.entries.map((entry) {
          return Contact.fromJson(
              entry.key, Map<String, dynamic>.from(entry.value));
        }).toList();
      } else {
        contactList.clear();
      }
    });
  }

  // Add a new contact
  Future<void> addContact(Contact contact) async {
    try {
      await _firebaseHelper.addContact(contact);
      Get.snackbar('Success', 'Contact added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add contact: $e');
    }
  }

  // Update an existing contact
  Future<void> updateContact(Contact contact) async {
    try {
      await _firebaseHelper.updateContact(contact);
      Get.snackbar('Success', 'Contact updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update contact: $e');
    }
  }

  // Delete a contact
  Future<void> deleteContact(String id) async {
    try {
      await _firebaseHelper.deleteContact(id);
      Get.snackbar('Success', 'Contact deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete contact: $e');
    }
  }
}
