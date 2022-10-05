import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login_view.dart';


class NotLogIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                ' يجب تسجيل الدخول حتي تتمكن من اضافه منتجات الي متجرك او تعديل حسابك',textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => LoginView());
              },
              child:   Container(
                child: Text(
                  '  تسجيل الدخول  ',textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
