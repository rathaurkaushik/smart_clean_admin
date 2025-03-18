import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_clean_admin/view/screens/auth/login_screen.dart';
import 'package:smart_clean_admin/view/screens/request/request_controller.dart';

class RequestScreen extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(builder: (ctrl) {
      return Scaffold(
        body: Center(child: ElevatedButton(onPressed: () {
ctrl.signOut();

        }, child: Text('Log out')),),
      );
    });
  }
}
