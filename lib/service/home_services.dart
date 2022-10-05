import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../auth/auth_view_model.dart';
import '../model/product_model.dart';
import '../model/shopeModel.dart';
import '../model/user_model.dart';

class HomeService {
  final userId = Get.find<AuthViewModel>().userId;
  final Reference _refstorge = FirebaseStorage.instance.ref('image');

  Reference get fireStorge => _refstorge;

  final CollectionReference _ShopCollectionRef =
      FirebaseFirestore.instance.collection('shop');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Products');
  final CollectionReference _usertCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  CollectionReference get usertCollectionRef => _usertCollectionRef;

  CollectionReference get ShopCollectionRef => _ShopCollectionRef;

  CollectionReference get productCollectionRef => _productCollectionRef;


  setUserProfile(UserModel userModel) async {
    await _usertCollectionRef
        .doc(userId)
        .set(userModel.toJson(), SetOptions(merge: true));
    setShopProfile(ShopeModel(
        shopeId: userId!,des:userModel.des,
        shopeName: userModel.shopname,
        phone: userModel.phone,
        whatsapp: userModel.whatsapp));
  }

  setShopProfile(ShopeModel shopeModel) async {
    await _ShopCollectionRef.doc(userId)
        .set(shopeModel.toMap(), SetOptions(merge: true));
  }

  addProdactToWeb({required File image,required ProductModel productModel}) {
    _productCollectionRef
        .doc(userId)
        .collection('UserProdect')
        .get()
        .then((value) {
      if (value.docs.length >= 100) {
        Get.snackbar('', 'لا يمكن اضافه اكتر من ثلاث منتجات');
      } else {
        _refstorge.child(userId!).putFile(image).then((v) async {
          productModel.image = await _refstorge.getDownloadURL();
          _productCollectionRef
              .doc(userId)
              .collection('UserProdect')
              .add(productModel.toMap())
              .then((value) {
            Get.snackbar('', 'تم اضافه المنتج الي متجرك بنجاح');
          });
        });
      }
    });
  }
  // deletItem({String id, String Path}){
  //   _productCollectionRef.doc(Path).collection('UserProdect').doc(id).delete();
  // }
}
