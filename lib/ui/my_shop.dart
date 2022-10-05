import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rama/ui/the_shope.dart';

import '../model/shopeModel.dart';
import '../view_model/my_shop_model.dart';
import '../view_model/shope_view_model.dart';
import '../widgets/custom_input_filed.dart';
import '../widgets/custom_text.dart';


class MyShop extends GetWidget<MyShopModel> {
  File? image;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('store'),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      controller.pickImage();
                    },
                    child: GetBuilder<MyShopModel>(
                      builder: (logic) {
                        return Container(
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
                                offset: Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: size.height * .25,
                          width: size.width,
                          child: logic.image != null
                              ? Image.file(
                            logic.image!,
                            fit: BoxFit.fill,
                          )
                              : Image.asset(
                            'assets/images/addcamera.png',
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Custom_Input_Filed(maxline: 1,keyboardType:TextInputType.text ,
                    textEditingController: controller.prodect_Name,
                    label: 'product name',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Custom_Input_Filed(maxline: 1,
                    textEditingController: controller.prodect_price,
                    label: 'price',
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Custom_Input_Filed(
                    textEditingController: controller.prodect_Des,
                    maxline: 6,
                    label: 'the description',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ), GetBuilder<MyShopModel>(
                    builder: (logic) {

                      return  logic.loading?CircularProgressIndicator():  ElevatedButton(
                          onPressed: () {
                            controller.loddata(true);
                            controller.add_prodect_to_web();
                          },
                          child: CustomText(
                            text: "Add to my store",
                            color: Colors.white,
                            fontSize: 18,
                            alignment: Alignment.center,
                          ));
                    },
                  ),
                  const SizedBox(height: 16,),
                  ElevatedButton(
                      onPressed: () {
                        Get.find<ShopeViewModel>()
                            .getMyShopeProdect(shopeId: controller.userId!);
                        Get.find<ShopeViewModel>().getmyshopmodel(shopeId: controller.userId!).then((value) {

                          // Get.find<ShopeViewModel>().setShop(ShopeModel.fromMap(value.data()));
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(
                          //     builder: (context,) =>
                          //         TheShope()));
                        });

                      },
                      child: CustomText(
                        text: "View my store",
                        color: Colors.white,
                        fontSize: 18,
                        alignment: Alignment.center,
                      ))


                ],
              ),
            )));
  }
}
