import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      firstName: data['frist_name'] ?? '', // صحح الاسم
      lastName: data['last_name'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'frist_name': firstName,
      'last_name': lastName,
      'email': email,
    };
  }
}
