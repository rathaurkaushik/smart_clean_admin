import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smart_clean_admin/constants/app_color.dart';
import 'package:smart_clean_admin/view/screens/dashboard/dashboard_controller.dart';
import 'package:smart_clean_admin/view/screens/home/home_screen.dart';
import 'package:smart_clean_admin/view/screens/profile/profile_screen.dart';
import 'package:smart_clean_admin/view/screens/request/request_screen.dart';
import 'package:smart_clean_admin/view/screens/setting/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // final _inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<DashboardController>(builder: (ctrl) {
      return Scaffold(
          appBar: AppBar(
            key: _scaffoldKey,
            backgroundColor: AppColor.appBarColor,
            centerTitle: true,
            title: Text(
              'Dashboard',
              style: TextStyle(
                color: AppColor.appWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                color: AppColor.appWhiteColor,
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
            ],
            leading: IconButton(
              color: AppColor.appWhiteColor,
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: const Icon(Icons.menu_outlined),
            ),
          ),
          body: SafeArea(
              child: IndexedStack(
            index: ctrl.tabIndex,
            children: [
              HomeScreen(),

              RequestScreen(),
              ProfileScreen(),
              SettingScreen(),
            ],
          )),
          bottomNavigationBar:
          CurvedNavigationBar(
            backgroundColor: Colors.white, // Scaffold background color
            color: Colors.green, // Navigation bar color
            buttonBackgroundColor: Colors.green, // Active item background color
            height: 60, // Navigation bar height
            index: ctrl.tabIndex, // Current selected index
            animationCurve: Curves.easeIn, // Animation effect
            animationDuration: Duration(milliseconds: 300), // Animation speed
            items: [
              Icon(Icons.home, size: 25, color: Colors.white), // Home Icon
              SvgPicture.asset(
                'assets/icons/request_icon.svg',
                height: 25, // Adjust size
                width: 25,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn), // Change color
              ),
              Icon(Icons.person, size: 25, color: Colors.white), // Message Icon
              Icon(Icons.settings, size: 25, color: Colors.white), // Settings Icon
            ],
            onTap: (index) {
              ctrl.changeTabIndex(index); // Change tab index using controller
            },
          )
      );
    });
  }
}
