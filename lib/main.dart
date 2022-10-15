import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_view.dart';
import 'auth/register_view.dart';
import 'binding/binding_auth.dart';
import 'binding/binding_home.dart';
import 'middleware/auth_middleware.dart';
import 'ui/edit_prodect.dart';
import 'ui/home_screen.dart';

void main() async{
     WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),initialRoute: "/",initialBinding: AuthBinding(),
      getPages: [
        GetPage(
          name: "/Home",
          page: () => const Home(),
          binding: HomeBinding(),
        ),
        GetPage(
            name: "/",
            page: () => LoginView(),
            binding: AuthBinding(),
            middlewares: [
              AuthMiddleWare()
            ]),
        GetPage(
            name: "/RegisterView",
            page: () => RegisterView(),
            binding: AuthBinding()),
        // GetPage(
        //     name: "/EditProdect",
        //     page: () => EditProdect(),
        //     binding: AuthBinding()),

      ],
    );
  }
}
