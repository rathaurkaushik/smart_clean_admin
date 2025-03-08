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

  Widget BottomNavigation(BuildContext context) {
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

  Widget buildCard({required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        elevation: 2,
        color: AppColor.appWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 11),
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for Info Rows
  Widget buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 18),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColor.grayTextColor,
                      fontWeight: FontWeight.w700)),
              Text(value,
                  style: TextStyle(
                      fontSize: 14,

                      color: AppColor.appBlackColor,

                      fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method for Buttons
  Widget buildButtonCard(IconData icon, String text, Color? bgColor,
      {Color textColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        elevation: 1,
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: textColor),
              SizedBox(width: 5),
              Text(text, style: TextStyle(color: textColor)),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for Performance Rows
  Widget buildPerformanceRow(
      String title, String value, Color color, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 13)),
              Text(value, style: TextStyle(fontSize: 13)),
            ],
          ),
          SizedBox(height: 4),
          SizedBox(
            height: 6,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(12),
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Input Card for TextField
Widget buildInputCard({

  required IconData icon,
  required String hintText,
  required String labelText,
  bool isPassword = false,
  required TextEditingController controller,
}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColor.appBarColor),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.appBarColor, width: 2),
        ),
      ),
    ),
  );
}
