import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../auth/auth_view_model.dart';



class AuthMiddleWare extends GetMiddleware {


  @override
  RouteSettings? redirect(String? route) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    if ( auth.currentUser!=null ) {
      return const RouteSettings(name: "/Home");

    }
  }
}
