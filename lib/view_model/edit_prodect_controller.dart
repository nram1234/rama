import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/auth_view_model.dart';
import '../model/product_model.dart';
import '../service/home_services.dart';


class EditProdectController extends GetxController {
  TextEditingController prodect_Name = TextEditingController();
  TextEditingController prodect_price = TextEditingController();
  TextEditingController prodect_Des = TextEditingController();
  ProductModel? product;
  updateprodect() {
    ProductModel productModel = ProductModel(description: prodect_Des.text,image: product?.image,
        price: prodect_price.text,
        name: prodect_Name.text);
    HomeService().productCollectionRef.doc(Get
        .find<AuthViewModel>()
        .userId).collection('UserProdect').doc(product?.itemIDinDB).set(productModel.toMap() , SetOptions(merge: true));
  }
  setproductModel(ProductModel p){
    product=p;
    prodect_Name.text=p.name!;
    prodect_price.text=p.price!;
    prodect_Des.text=p.description!;



    update();
  }
}