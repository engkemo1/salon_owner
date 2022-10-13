import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? uid;
  final String? phone;
  final String? password;
  final String? role;
  final String? salonId;

  final String? imageUrl;

  UserModel( {
    required this.salonId,
    required this.role,
    required this.password,
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.uid,
   required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'password': password,
        "name": name,
        "email": email,
        "uid": uid,
        'phone': phone,
        'role': role,
    'imageUrl': imageUrl

  };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        password: snapshot['password'],
        email: snapshot['email'],
        uid: snapshot['uid'],
        name: snapshot['name'],
        phone: snapshot['phone'],
        role: snapshot['role'], imageUrl:snapshot['imageUrl'], salonId: snapshot['salonId'] );
  }
}
