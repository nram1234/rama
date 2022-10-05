import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../view_model/shope_view_model.dart';
import 'shop_item.dart';

class TheShope extends GetWidget<ShopeViewModel> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' ${controller.shopeData?.shopeName}'),
      ),
      body: GetBuilder<ShopeViewModel>(
        builder: (logic) {
          print('prodects prodects   ${logic.prodects.length}');
          return logic.loading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: logic.prodects.length,
                  itemBuilder: (context, pos) {
                    // if(pos==0){
                    //
                    //     return Container(
                    //     height: 320,
                    //     child: AdWidget(
                    //       ad: Get.find<AdsController>().inlistbannerAd,
                    //     ),
                    //   );
                    // }else{
                    return ShopItem(

                      productModel: logic.prodects[pos],
                    );
                    //}
                  });
        },
      ),
    );
  }
}
