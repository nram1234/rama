


import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';


class FireStoreUser {
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}


