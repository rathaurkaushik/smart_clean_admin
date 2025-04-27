import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_clean_admin/constants/app_color.dart';
import 'package:smart_clean_admin/view/screens/home/home_controller.dart';
import 'package:smart_clean_admin/view/screens/request/request_controller.dart';

class RequestCard extends StatelessWidget {
  final String name;
  final String phone;
  final String status;
  final String time;
  final VoidCallback? onTap;

  RequestCard({
    super.key,
    required this.name,
    required this.phone,
    required this.status,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color chipColor;
    Color chipTextColor;

    switch (status) {
      case 'Completed':
        chipColor = Colors.green.shade100;
        chipTextColor = Colors.green.shade800;
        break;
      case 'Pending':
        chipColor = Colors.orange.shade100;
        chipTextColor = Colors.orange.shade800;
        break;
      default:
        chipColor = Colors.grey.shade200;
        chipTextColor = Colors.grey.shade800;
    }

    return GetBuilder<RequestController>(builder: (ctrl) {
      return GestureDetector(
        onTap: onTap,
        child: Card(
          color: AppColor.appWhiteColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 8),
                  Text(name)
                ]),
                const SizedBox(height: 8),
                Row(children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 8),
                  Text(phone)
                ]),
                // const SizedBox(height: 8),
                Row(children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 8),
                  Text(time),
                  const Spacer(),
                  Chip(
                    label: Text(status),
                    backgroundColor: chipColor,
                    labelStyle: TextStyle(color: chipTextColor),
                  )
                ]),
                const Divider(height: 20),


              ],
            ),
          ),
        ),
      );
    });
  }
}
