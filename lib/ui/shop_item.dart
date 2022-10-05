import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../auth/auth_view_model.dart';
import '../model/product_model.dart';
import '../view_model/edit_prodect_controller.dart';
import '../view_model/shope_view_model.dart';
import 'edit_prodect.dart';


class ShopItem extends StatelessWidget {
  ProductModel productModel;

  ShopeViewModel _shopeModel = Get.find<ShopeViewModel>();

  ShopItem({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: EdgeInsets.only(left: 8, right: 8, top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${productModel.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'السعر : ${productModel.price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'رقم الهاتف : ${_shopeModel.shopeData?.phone}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  child: Image.network(
                    productModel.image!,
                    height: MediaQuery.of(context).size.height * .2,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            trailing: Text(
              'التفاصيل',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            title: _shopeModel.shopeData?.shopeId ==
                    Get.find<AuthViewModel>().userId
                ? Row(
                    children: [

                      GestureDetector(
                          onTap: () {
                            _shopeModel.delprodect(
                                imagelinke: productModel.image!,
                                id: productModel.itemIDinDB!,
                                Path: Get.find<AuthViewModel>().userId!);
                          },
                          child: Icon(Icons.delete)),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            Get.find<EditProdectController>().setproductModel(productModel);
                            Get.to(() => EditProdect());
                          },
                          child: Icon(Icons.edit)),
                      Spacer() ],
                  )
                : const SizedBox(),
            children: [
              Image.network(
                productModel.image!,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .3,
              ),
              Text(productModel!.description!),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //
              //         },
              //         child: Image.asset(
              //           'assets/images/call.png',
              //           fit: BoxFit.fill,
              //           width: MediaQuery.of(context).size.height * .05,
              //           height: MediaQuery.of(context).size.height * .05,
              //         ),
              //       ),
              //       // GestureDetector(
              //       //   onTap: () {
              //       //     Share.share('https://play.google.com/store/apps/details?id=com.nr.mahale',
              //       //         subject:
              //       //             '${productModel.name} \n ${productModel.price} \n ${_shopeModel.shopeData.phone} \n افضل العروض و الاسعار و المنتجات ');
              //       //   },
              //       //   child: Image.asset(
              //       //     'assets/images/share.png',
              //       //     fit: BoxFit.fill,
              //       //     width: MediaQuery.of(context).size.height * .05,
              //       //     height: MediaQuery.of(context).size.height * .05,
              //       //   ),
              //       // ),
              //       // GestureDetector(
              //       //   onTap: () {
              //       //     // FlutterOpenWhatsapp.sendSingleMessage(
              //       //     //     _shopeModel.shopeData.whatsapp, "السلام عليكم");
              //       //     // launchWhatsApp(phone: whatsapp,message: "السلام عليكم");
              //       //   },
              //       //   child: Image.asset(
              //       //     'assets/images/whatsapp.png',
              //       //     fit: BoxFit.fill,
              //       //     width: MediaQuery.of(context).size.height * .05,
              //       //     height: MediaQuery.of(context).size.height * .05,
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }

// Future<void> _makePhoneCall({String url}) async {
//   if (await canLaunch(url)) {
//     await launch("tel://21213123123");
//   } else {
//     throw 'Could not launch $url';
//   }
// }
// void launchWhatsApp({
//   @required String phone,
//   @required String message,
// }) async {
//   String url() {
//     if (Platform.isIOS) {
//       return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
//     } else {
//       return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
//     }
//   }
//
//   if (await canLaunch(url())) {
//     await launch(url());
//   } else {
//     throw 'Could not launch ${url()}';
//   }
// }
}
