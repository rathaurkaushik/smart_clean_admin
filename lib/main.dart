import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_clean_admin/firebase_opt.dart';
import 'package:smart_clean_admin/view/screens/auth/auth_binding.dart';
import 'package:smart_clean_admin/view/screens/auth/auth_controller.dart';
import 'package:smart_clean_admin/view/screens/auth/login_screen.dart';
import 'package:smart_clean_admin/view/screens/auth/signup_screen.dart';
import 'package:smart_clean_admin/view/screens/dashboard/dashboard_binding.dart';
import 'package:smart_clean_admin/view/screens/dashboard/dashboard_controller.dart';
import 'package:smart_clean_admin/view/screens/dashboard/dashboard_screen.dart';
import 'package:smart_clean_admin/view/screens/home/home_binding.dart';
import 'package:smart_clean_admin/view/screens/home/home_controller.dart';
import 'package:smart_clean_admin/view/screens/home/home_screen.dart';
import 'package:smart_clean_admin/view/screens/profile/profile_binding.dart';
import 'package:smart_clean_admin/view/screens/profile/profile_controller.dart';
import 'package:smart_clean_admin/view/screens/profile/profile_screen.dart';
import 'package:smart_clean_admin/view/screens/profile/resetAccount.dart';
import 'package:smart_clean_admin/view/screens/request/request_binding.dart';
import 'package:smart_clean_admin/view/screens/request/request_controller.dart';

import 'package:smart_clean_admin/view/screens/request/request_screen.dart';
import 'package:smart_clean_admin/view/screens/setting/setting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  Get.put(HomeController());
  Get.put(RequestController());
  Get.put(ProfileController());
  Get.put(AuthController());
  Get.put(DashboardController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: isLoggedIn ? "/" : "/signup",
        initialBinding: DashboardBinding(),
        getPages: [
          GetPage(
              name: "/",
              page: () => DashboardScreen(),
              binding: DashboardBinding()),
          GetPage(
            name: "/login",
            page: () => LoginScreen(),
          ),
          GetPage(
            name: "/signup",
            page: () => SignupScreen(),
            binding: AuthBinding(),
          ),
          GetPage(
              name: "/home", page: () => HomeScreen(), binding: HomeBinding()),
          GetPage(
            name: "/profile",
            page: () => ProfileScreen(),
            binding: ProfileBinding(),
          ),
          GetPage(
              name: "/request",
              page: () => RequestScreen(),
              binding: RequestBinding()),
          GetPage(
            name: "/setting",
            page: () => SettingScreen(),
          ),
          GetPage(
            name: "/resetAccount",
            page: () => ResetAccount(),
          ),
        ]);
  }
}
