import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_clean_admin/firebase_opt.dart';
import 'package:smart_clean_admin/view/screens/dashboard/dashboard_binding.dart';
import 'package:smart_clean_admin/view/screens/dashboard/dashboard_screen.dart';
import 'package:smart_clean_admin/view/screens/home/home_controller.dart';
import 'package:smart_clean_admin/view/screens/home/home_screen.dart';
import 'package:smart_clean_admin/view/screens/profile/profile_screen.dart';
import 'package:smart_clean_admin/view/screens/request/request_screen.dart';
import 'package:smart_clean_admin/view/screens/setting/setting_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      initialBinding: DashboardBinding(),
      getPages: [
        GetPage(
          name: "/",
          page: () => DashboardScreen(),
          binding: DashboardBinding()
        ),
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
        ),
        GetPage(
          name: "/profile",
          page: () => ProfileScreen(),
        ),
        GetPage(
          name: "/request",
          page: () => RequestScreen(),
        ),
        GetPage(
          name: "/setting",
          page: () => SettingScreen(),
        )
      ]
    );
  }
}
