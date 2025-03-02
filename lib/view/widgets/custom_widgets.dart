import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_clean_admin/constants/app_color.dart';

class CustomWidgets {
  int currentYear = DateTime.now().year;
  final String companyName = 'Smart-Waste-Manage';

  //    custom drawer
  Widget CustomDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Profile Section
          Container(
            width: double.infinity,
            child: DrawerHeader(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(color: AppColor.appBarColor),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/man.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kaushik Rathaur',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColor.appWhiteColor),
                    ),
                    Text(
                      '+91 9099544962',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.appWhiteColor),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Navigation List Items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView(
                children: [
                  _buildDrawerItem('Home', 'assets/images/home.webp',
                      () => Get.toNamed('/')),
                  _buildDrawerItem('Request', 'assets/images/request.webp',
                      () => Get.toNamed('/requests')),
                  _buildDrawerItem('Stats', 'assets/images/stats.webp',
                      () => Get.toNamed('/stats')),
                  _buildDrawerItem('Profile', 'assets/images/person.webp',
                      () => Get.toNamed('/profile')),
                  _buildDrawerItem('Settings', 'assets/images/setting.webp',
                      () => Get.toNamed('/settings')),
                ],
              ),
            ),
          ),

          // Copyright Section at Bottom
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              '© $currentYear $companyName.\nAll Rights Reserved.',
              style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build ListTile items
  Widget _buildDrawerItem(String title, String iconPath, VoidCallback onTap) {
    return ListTile(
      // ✅ Correct, no Flexible needed
      leading: Image.asset(iconPath, width: 24, height: 24),
      title: Text(title),
      onTap: onTap,
    );
  }

  // Navigation Widget

  Widget
  BottomNavigation(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.blue.shade100,
      color: AppColor.appBarColor,
      animationDuration: Duration(milliseconds: 300),
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/');
            break;
          case 1:
            Get.toNamed('/search');
            break;
          case 2:
            Get.toNamed('/setting');
            break;
        }
      },
      items: [
        Icon(Icons.home, size: 24, color: Colors.white),
        Icon(Icons.search, size: 24, color: Colors.white),
        Icon(Icons.person, size: 24, color: Colors.white),
      ],
    );
  }
}

// Navigation Widget
