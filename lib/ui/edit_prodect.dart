import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_buttom.dart';
import '../widgets/custom_input_filed.dart';
import 'edit_prodect_controller.dart';


class EditProdect extends GetWidget<EditProdectController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل المنتج'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Container(

                height: size.height * .25,
                width: size.width,
                 child: Image.network(controller.product!.image!),
              ),
              SizedBox(
                height: 16,
              ),
              Custom_Input_Filed(keyboardType:   TextInputType.text,
                textEditingController: controller.prodect_Name,
                label: 'اسم المنتج', maxline: 1,
              ),
              SizedBox(
                height: 16,
              ),
              Custom_Input_Filed( maxline: 1,
                textEditingController: controller.prodect_price,
                label: 'السعر',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              Custom_Input_Filed(
                textEditingController: controller.prodect_Des,
                maxline: 6,
                label: 'الوصف',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                onPress: () {
                  controller.updateprodect();
                },
                text: 'تعديل',
              ),  ],
          ),
        ),
      ),
    );
  }
}
