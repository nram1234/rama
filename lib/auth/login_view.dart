import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rama/auth/register_view.dart';

import '../widgets/custom_buttom.dart';
import '../widgets/custom_input_filed.dart';
import '../widgets/custom_text.dart';
import 'auth_view_model.dart';


class LoginView extends GetWidget<AuthViewModel> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
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
                      text: "Welcome",
                      fontSize: 30,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("RegisterView");
                      },
                      child: CustomText(
                        text: "Register New Account",
                        color: Colors.cyan,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // CustomText(
                //   text: 'Sign in to Continue',
                //   fontSize: 14,
                //   color: Colors.grey,
                // ),
                SizedBox(
                  height: 15,
                ),
                Custom_Input_Filed(keyboardType: TextInputType.text, maxline: 1,
                  textEditingController: controller.email,
                  label: "Email",

                ),
                SizedBox(
                  height: 20,
                ),
                Custom_Input_Filed(keyboardType: TextInputType.text,
                  maxline: 1,

                  textEditingController: controller.password,
                  label: "password",
                  obscureText: true,


                ),
                // SizedBox(
                //   height: 20,
                // ),
                // CustomText(
                //   text: 'Forgot Password?',
                //   fontSize: 14,
                //   alignment: Alignment.topRight,
                // ),
                SizedBox(
                  height: 15,
                ),
                GetBuilder<AuthViewModel>(builder: (logic) {
                  return logic.regOrLogin?Center(child: CircularProgressIndicator(),):
                    CustomButton(
                    onPress: () {
                      // controller.formKey.currentState.save();
                      //

                      controller.signInWithEmailAndPassword();
                    },
                    text: 'login',
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                // CustomText(
                //   text: '-OR-',
                //   alignment: Alignment.center,
                // ),
                // SizedBox(
                //   height: 20,
                // ),

                // CustomButtonSocial(
                //   text: 'Google الدخول عن طريق جوجال ',
                //   onPress: () {
                //     controller.googleSignInMethod();
                //   },
                //   imageName: 'assets/images/google.png',
                // ),
              ],
            ),
          ),)
        ,
      )
      ,
    );
  }
}
