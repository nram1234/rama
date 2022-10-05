
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import 'dart:math';
import '../auth/auth_view_model.dart';
import '../model/product_model.dart';
import '../service/home_services.dart';


class MyShopModel extends GetxController {

 bool  loading = false ;
  final userId = Get.find<AuthViewModel>().userId;
  File? image;
  TextEditingController prodect_Name = TextEditingController();
  TextEditingController prodect_price = TextEditingController();
  TextEditingController prodect_Des = TextEditingController();

  Future pickImage() async {
    final picker = ImagePicker();
    XFile? img = await picker.pickImage(source: ImageSource.gallery,maxHeight: 512,maxWidth: 512,imageQuality: 90);
   if(img!=null){
     image=File(img.path);
     update();
   }
    //_cropImage(File(img!.path));
  }


loddata(bool val){
   loading=val;
  update();
}
  add_prodect_to_web() async{
    if (image != null &&
        prodect_Des.text != null &&
        prodect_Name.text != null &&
        prodect_price.text != null) {
      final FirebaseAuth auth = FirebaseAuth.instance;


      // HomeService().addProdactToWeb(
      //     image: image,
      //     productModel: ProductModel(
      //         name: prodect_Name.text,
      //         price: prodect_price.text,
      //         description: prodect_Des.text,
      //         image: ''));


var random=Random();

      HomeService().productCollectionRef.doc(auth.currentUser!.uid ).collection('UserProdect').get().then((value)  async {
        // if(value.docs.length>=5){
        //   Get.snackbar('', 'لا يمكن اضافه اكتر من 5 منتجات');
        // }
        // else{

          var nameofimage=auth.currentUser!.uid+random.nextInt(10000).toString();

          await   HomeService().fireStorge.child(auth.currentUser!.uid).child( nameofimage).putFile(image!);


          ProductModel    productModel = ProductModel(
              name: prodect_Name.text,
              price: prodect_price.text,
              description: prodect_Des.text,
              image: '');
print(auth.currentUser!.uid);
         await  HomeService().fireStorge.child(auth.currentUser!.uid).child( nameofimage).getDownloadURL().then((value) {
              productModel.image=value;
             HomeService().productCollectionRef.doc(auth.currentUser!.uid).collection('UserProdect').add(productModel.toMap());
              });
        //  }



        prodect_Name.clear();
        prodect_price.clear();
        prodect_Des.clear();
        image=null;
        loddata(false);
      update();});
      



    } else {
      Get.snackbar('mistake', 'Please provide the product information');
    }

 }
}
