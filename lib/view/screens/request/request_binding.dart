import 'package:get/get.dart';
import 'package:smart_clean_admin/view/screens/request/request_controller.dart';

class RequestBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RequestController>(()=> RequestController());
  }
}