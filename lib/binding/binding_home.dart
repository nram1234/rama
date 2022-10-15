
import 'package:get/get.dart';

import '../ui/home_controller.dart';
import '../view_model/edit_prodect_controller.dart';
import '../view_model/my_shop_model.dart';
import '../view_model/profile_view.dart';
import '../view_model/shope_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<ProfileViewModel>(ProfileViewModel());
    Get.put<MyShopModel>(MyShopModel());
    Get.put<ShopeViewModel>(ShopeViewModel());
    Get.put<EditProdectController>(EditProdectController());







  }
}