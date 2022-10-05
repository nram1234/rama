import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rama/ui/profile_view.dart';

import '../model/shopeModel.dart';
import '../service/home_services.dart';
import 'home_view.dart';
import 'my_shop.dart';

class HomeController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  int index=0;
  List<Widget>screens=[HomeView(),MyShop(),ProfileView() ];
  Widget? screen;


  @override
  void onInit() {
    super.onInit();
    screen=screens[0];
    getShop();
  }

  myScr(int index){
    this.index=index;
    screen=screens[index];
    update();
  }



  List<ShopeModel> _shopeModel = [];

  List<ShopeModel> get shopeModel => _shopeModel;
  List<Object>itemList=[];
  final ValueNotifier<bool> loading = ValueNotifier(true);


  Future<List<ShopeModel>> getShop() async {
    //   _loading.value = true;
    //   HomeService().ShopCollectionRef.limit(100).snapshots().listen((event) {
    //     _shopeModel.clear();
    //     event.docs.forEach((element) {
    //       _shopeModel.add(ShopeModel.fromMap(element.data()));
    //     });
    //     _loading.value = false;
    // update();
    //   });
    //   return _shopeModel;
    HomeService().ShopCollectionRef.snapshots().listen((event) {
      _shopeModel.clear();
      event.docs.forEach((element) {
       _shopeModel.add(ShopeModel.fromMap(element.data() as Map<String,dynamic>));
      });
      itemList=List.from(shopeModel);
      // for(int i=itemList.length-2;i>=1;i-=4){
      //   itemList.insert(i, Get.find<AdsController>().inlistbannerAd);
      // }
      loading.value = false;
      update(); });
    return _shopeModel;}
}