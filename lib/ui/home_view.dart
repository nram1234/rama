import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/shopeModel.dart';
import '../view_model/shope_view_model.dart';
import '../widgets/shopListItem.dart';
import 'home_controller.dart';
import 'the_shope.dart';


class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,centerTitle: true,
        title: Text(
          'Welcome',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        actions: [],
      ),
      body: Column(children: [
     //    GridView.
     // // StreamBuilder<QuerySnapshot>(
     // //   stream:   controller.   firestore
     // //       .collection('users')
     // //       .snapshots().asBroadcastStream()
     // //       ,
     // //   builder: (context, snapshot) {
     // //     print("snapshot.data=;;;>  ${snapshot.data?.docs.length}");
     // //     return Container();
     // //   }
     // // )
        Expanded(
            flex: 1,
            child: GetBuilder<HomeController>(
              builder: (controller) => controller.loading.value
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.itemList.length,
                      itemBuilder: (context, pos) {
                              return
                          GestureDetector(
                            onTap: () {
                              Get.find<ShopeViewModel>().setShop(
                                  controller.shopeModel[pos]);

                              Get.find<ShopeViewModel>()
                                  .getShopeProdect();
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                  builder: (
                                      context,
                                      ) =>
                                      TheShope()));
                            },
                            child: ShopListItem(
                              shopeModel: controller.itemList[pos] as ShopeModel,
                            ),
                          );

                      },
                    ),
                  )
                  // ,  Expanded(
                  //       flex: 1,
                  //       child: GridView.builder(
                  //         gridDelegate:
                  //             SliverGridDelegateWithFixedCrossAxisCount(
                  //                 crossAxisCount: 1,
                  //                 crossAxisSpacing: 5,
                  //                 childAspectRatio: 1),
                  //         itemCount: controller.shopeModel.length,
                  //         itemBuilder: (context, pos) {
                  //           return controller.shopeModel[pos].des
                  //                   .contains(controller.searchWord)
                  //               ? GestureDetector(
                  //                   onTap: () {
                  //                     Get.find<ShopeViewModel>().setShop(
                  //                         controller.shopeModel[pos]);
                  //
                  //                     Get.find<ShopeViewModel>()
                  //                         .getShopeProdect();
                  //                     Navigator.of(context)
                  //                         .push(MaterialPageRoute(
                  //                             builder: (
                  //                       context,
                  //                     ) =>
                  //                                 TheShope()));
                  //                   },
                  //                   child: ShopListItem(
                  //                     shopeModel:
                  //                         controller.shopeModel[pos],
                  //                   ),
                  //                 )
                  //               : const SizedBox();
                  //         },
                  //       )),
                ],
              ),
            ))  ]),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
