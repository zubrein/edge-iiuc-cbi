class Contact {
  String id;
  String name;
  String email;
  String phone;

  Contact({required this.id, required this.name, required this.email, required this.phone});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  static Contact fromJson(String id, Map<String, dynamic> json) {
    return Contact(
      id: id,
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
