import 'package:get/get.dart';
import 'package:smart_clean_admin/view/screens/profile/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfileController>(()=> ProfileController());
  }
}