import 'package:get/get.dart';

import '../models/contact.dart';

class ContactController extends GetxController {
  // Observables
  var contactList = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  // Fetch contacts using FirebaseHelper
  void fetchContacts() {}

  // Add a new contact
  Future<void> addContact(Contact contact) async {}

  // Update an existing contact
  Future<void> updateContact(Contact contact) async {}

  // Delete a contact
  Future<void> deleteContact(String id) async {}
}
