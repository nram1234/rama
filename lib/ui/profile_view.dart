import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../auth/auth_view_model.dart';
import '../model/user_model.dart';
import '../view_model/profile_view.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_input_filed.dart';


class ProfileView extends GetWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Text('Edit my data'),
        centerTitle: true,
      ),
      body: GetBuilder<ProfileViewModel>(
        builder: (logic) {
          return Form(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  children: [
                    Custom_Input_Filed(  keyboardType: TextInputType.text,
                      textEditingController: controller.name,
                      label: 'name', maxline: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Custom_Input_Filed(maxline: 1,
                      textEditingController: controller.phone,
                      label: 'phone',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Custom_Input_Filed(maxline: 1,
                      textEditingController: controller.whatsapp,
                      label: 'phone',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Custom_Input_Filed(maxline: 1,
                      textEditingController: controller.addrs,
                      label: 'address',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Custom_Input_Filed(maxline: 1,
                      textEditingController: controller.storename,
                      label: 'Store name',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Custom_Input_Filed(
                      textEditingController: controller.des,
                      label: 'Store Description',
                      keyboardType: TextInputType.text,
                      maxline: 5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onPress: () {
                       // UserModel userModel=UserModel();

                        controller.setMyProfile( );
                      },
                      text: 'Modify',
                    ),SizedBox(height: 20,),
                    CustomButton(
                      onPress: () async {
                        //await Get.find<AuthViewModel>().logout();

                     //   Get.find<ControlViewModel>().changeSelectedValue(0);
                      //  SystemNavigator.pop();
                        },
                      text: 'Signout ',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
