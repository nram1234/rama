
import 'package:get/get.dart';

import '../auth/auth_view_model.dart';
import '../ui/home_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthViewModel>(AuthViewModel());




  }
}