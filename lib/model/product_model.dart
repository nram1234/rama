
import 'package:flutter/cupertino.dart';



class ProductModel {
  String? name, image, description,price,itemIDinDB;


  ProductModel(
      { required this.name,  this.itemIDinDB,
       required this.image,
       required this.description,required this.price
        });



  Map<String, dynamic> toMap() {
    Map <String,dynamic>data={};

    data['name']  = this.name;
    data[ 'image'] = this.image;
    data['description']  = this.description;
    data[ 'price'] =this.price;
    data[ 'itemIDinDB'] = this.itemIDinDB;
   return data;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name']  ,
      image: map['image']  ,
      description: map['description']  ,
      price: map['price'] ,
      itemIDinDB: map['itemIDinDB']  ,
    );
  }
}
