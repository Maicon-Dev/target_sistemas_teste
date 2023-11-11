import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:target_sistemas_teste/models/user_model.dart';

import '../firestore_service.dart';

class UserService extends FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserService() : super('users');

  Future<UserModel?> getUserByUserName(String userName) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('userName', isEqualTo: userName)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final data = jsonDecode(jsonEncode(querySnapshot.docs.first.data()));

        return UserModel(
          id: querySnapshot.docs.first.id,
          userAuthId: data['userAuthId'],
          email: data['email'],
          userName: data['userName'],
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
