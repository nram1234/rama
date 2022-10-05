import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widgets/custom_buttom.dart';
import '../widgets/custom_input_filed.dart';
import '../widgets/custom_text.dart';
import 'auth_view_model.dart';
import 'login_view.dart';

class RegisterView extends GetWidget<AuthViewModel> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(() => LoginView());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(

          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 100,
                        child: Image.asset('assets/images/shop.png',
                          fit: BoxFit.fill,)),
                    CustomText(
                      text: " Register account",
                      fontSize: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Custom_Input_Filed(
                  textEditingController: controller.name,
                  label: "Name", maxline: 1, keyboardType: TextInputType.text,

                ),
                SizedBox(
                  height: 20,
                ),
                Custom_Input_Filed(
                  maxline: 1,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: controller.email,
                  label: 'Email',

                ),
                SizedBox(
                  height: 20,
                ),
                Custom_Input_Filed(
                  keyboardType: TextInputType.text,
                  label: 'password',
                  maxline: 1,
                  textEditingController: controller.password,
                  obscureText: true,

                ),
                SizedBox(
                  height: 15,
                ),
                GetBuilder<AuthViewModel>(builder: (logic) {
                  return logic.regOrLogin?Center(child: CircularProgressIndicator(),): CustomButton(
                    onPress: () {
                      controller.createAccountWithEmailAndPassword();
                    },
                    text: 'Register',
                  );
                }),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
