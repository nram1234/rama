import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';
import '../model/shopeModel.dart';
import '../service/home_services.dart';

class ShopeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<ProductModel>prodects=[];
  ShopeModel? _shopeModel;
  ShopeModel? get shopeData=>_shopeModel;
  setShop(ShopeModel shopeModel){
    _shopeModel=shopeModel;
  }

getShopeProdect(){

  _loading.value = true;
  prodects.clear();
//'re09x5BTDXdvIMrdQ9XOMHhRard2'
//     HomeService().productCollectionRef.doc(_shopeModel.shopeId).collection('UserProdect').get().then((value) {
//       value.docs.forEach((element) {
//
//        ProductModel productModel=ProductModel.fromJson(element.data());
//        productModel.itemIDinDB=element.id;
//
//         prodects.add(productModel);
//       });
//       _loading.value = false;
//       update();  });
  HomeService().productCollectionRef.doc(_shopeModel?.shopeId).collection('UserProdect').snapshots().listen((event) {
    _loading.value = true;
    prodects.clear();
    event.docs.forEach((element) {

      ProductModel productModel=ProductModel.fromMap(element.data() as Map<String,dynamic>);
      productModel.itemIDinDB=element.id;

      prodects.add(productModel);
    });
    _loading.value = false;
    update();
  });
}
Future<DocumentSnapshot> getmyshopmodel({required String shopeId}){
    return HomeService().ShopCollectionRef.doc(shopeId).get();
}
  getMyShopeProdect({required String shopeId}){

    _loading.value = true;
    prodects.clear();
//'re09x5BTDXdvIMrdQ9XOMHhRard2'
    HomeService().productCollectionRef.doc(shopeId).collection('UserProdect').snapshots().listen((event) {
      _loading.value = true;
      prodects.clear();
      event.docs.forEach((element) {

        ProductModel productModel=ProductModel.fromMap(element.data());
        productModel.itemIDinDB=element.id;

        prodects.add(productModel);
      });
      _loading.value = false;
      update();
    });

  }
delprodect({required String imagelinke,required String id,required String Path}){
  FirebaseStorage.instance.refFromURL(imagelinke).delete();
  HomeService().productCollectionRef.doc(Path).collection('UserProdect').doc(id).delete();
}





}