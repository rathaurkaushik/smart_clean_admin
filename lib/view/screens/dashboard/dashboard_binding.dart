
import 'package:get/get.dart';
import 'package:smart_clean_admin/view/screens/dashboard/dashboard_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardController>(()=> DashboardController());
  }
}