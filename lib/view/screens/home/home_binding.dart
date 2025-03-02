
import 'package:get/get.dart';
import 'package:smart_clean_admin/view/screens/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(()=> HomeController());
  }

}