import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../auth/auth_view_model.dart';
import '../model/user_model.dart';
import '../service/home_services.dart';

class ProfileViewModel extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController addrs = TextEditingController();
  TextEditingController storename = TextEditingController();
  TextEditingController des = TextEditingController();
  var userId = Get.find<AuthViewModel>();
  setMyProfile( ) {
    HomeService().setUserProfile(UserModel(
        name:  name.text,
        addres:  addrs.text

        ,des:  des.text,pic:  "",userId: userId.userId!
        ,email:userId.email.text
        ,phone:  phone.text
        ,shopname:  storename.text
        ,whatsapp: whatsapp.text

    ));

  }

  @override
  void onInit() {
    print('ooooooooooooooooooooooooooooooooooooooooooooooooo');
    getUserProfile();
  }
sethope(){

}
  getUserProfile() async {


    HomeService().usertCollectionRef.doc(userId.userId).snapshots().listen((event) {
      // UserModel userModel = UserModel.fromMap(event!.data()!);
      //
      // name.text = userModel.name;
      //
      // phone.text = userModel.phone;
      // whatsapp.text = userModel.whatsapp;
      // addrs.text = userModel.addres;
      // storename.text = userModel.shopname;
      // des.text = userModel.des;
      // update();
    });
  }
}
