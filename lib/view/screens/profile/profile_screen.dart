import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_clean_admin/view/widgets/custom_widgets.dart';
import '../../../constants/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Profile Section
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.25,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade600, Colors.green.shade700],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/images/man.png'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'David Wilson',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Cleanup Provider',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    bottom: -30,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatColumn('156', 'Completed'),
                            _buildStatColumn('4.9', 'Rating'),
                            _buildStatColumn('98%', 'Success'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50),

              // Personal Info Card
              CustomWidgets().buildCard(
                title: "Personal Information",
                children: [
                  CustomWidgets().buildInfoRow(Icons.email_outlined, "Email", "david.wolson@example.com"),
                  CustomWidgets().buildInfoRow(CupertinoIcons.phone, "Phone", "+1 234 459 580"),
                  CustomWidgets().buildInfoRow(Icons.location_on_outlined, "Location", "New York, USA"),
                ],
              ),

              // Performance Card
              CustomWidgets().buildCard(
                title: "Performance",
                children: [
                  CustomWidgets().buildPerformanceRow("Response Rate", "98%", Colors.green, 0.98),
                  CustomWidgets().buildPerformanceRow("Completion Rate", "95%", Colors.blue, 0.95),
                ],
              ),

              // Reset Account Button
              CustomWidgets().buildButtonCard(CupertinoIcons.delete, "Reset Account", Colors.grey[300]),

              // Logout Button
              CustomWidgets().buildButtonCard(Icons.logout, "Logout", Colors.red, textColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}