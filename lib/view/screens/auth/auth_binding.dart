

import 'package:get/get.dart';
import 'package:smart_clean_admin/view/screens/auth/auth_controller.dart';

class AuthBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthController>(()=> AuthController());
  }
}