
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/user_model.dart';
import '../service/firestore_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthViewModel extends GetxController {
bool regOrLogin=false;
TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController name=TextEditingController();
 // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

 // String   name;

  Rxn<User> _user = Rxn<User>();



  String? get user => _user.value?.email;
String? get userId=>_user.value?.uid;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // void googleSignInMethod() async {
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   print(googleUser);
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleUser.authentication;
  //
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     idToken: googleSignInAuthentication.idToken,
  //     accessToken: googleSignInAuthentication.accessToken,
  //   );
  //
  //   await _auth.signInWithCredential(credential).then((user) {
  //     saveUser(user);
  //     Get.find<ControlViewModel>().changeSelectedValue(0);
  //     Get.back();
  //   });
  // }

  // void facebookSignInMethod() async {
  //   final AccessToken result = await FacebookAuth.getInstance().accessToken;
  //
  //   final FacebookAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(result.token);
  //
  //   await _auth.signInWithCredential(facebookAuthCredential).then((user) {
  //     saveUser(user);
  //   });
  // }

  void signInWithEmailAndPassword() async {
    regOrLogin=true;
    update();
    await _auth.signInWithEmailAndPassword(email: email.text, password: password.text).then((value) {

      Get.offAllNamed("Home");

      print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu    $value");
    });


  }

  void createAccountWithEmailAndPassword( ) async {
    regOrLogin=true;
    update();

    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    await _auth
        .createUserWithEmailAndPassword(email: email.text, password: password.text)
        .then((user) async {
          print("ooooooooooooooooooooooooooooooooo ${user.user}");
          // regOrLogin=false;
          // update();

          saveUser(user);
    });


  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user!.uid,
      email: user.user!.email!,addres: "",des: "",phone: "",shopname: "", whatsapp: "",
      name: name.text == null ? user.user!.displayName! : name.text,
      pic: '',
    )).then((value) {
      regOrLogin=false;

      Get.offAllNamed("Home");
      update();
    });
  }
  void logout(){
    _auth.signOut();

  }
}
