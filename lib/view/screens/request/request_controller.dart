
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_clean_admin/view/screens/auth/login_screen.dart';
import 'package:smart_clean_admin/view/screens/auth/signup_screen.dart';

class RequestController extends GetxController{
  FirebaseAuth _auth = FirebaseAuth.instance;
  void signOut(){
    _auth.signOut();
Get.offAllNamed("/login");
    // Get.toNamed("/login");
  }


}