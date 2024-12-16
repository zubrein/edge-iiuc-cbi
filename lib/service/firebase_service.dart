import 'package:firebase_database/firebase_database.dart';
import '../models/contact.dart';

class FirebaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref('contacts');

  // Add contact
  Future<void> addContact(Contact contact) async {
    final newRef = _dbRef.push();
    await newRef.set(contact.toJson());
  }

  // Update contact
  Future<void> updateContact(Contact contact) async {
    await _dbRef.child(contact.id).update(contact.toJson());
  }

  // Delete contact
  Future<void> deleteContact(String id) async {
    await _dbRef.child(id).remove();
  }

  // Get reference for streaming data
  DatabaseReference getContactsRef() {
    return _dbRef;
  }
}
