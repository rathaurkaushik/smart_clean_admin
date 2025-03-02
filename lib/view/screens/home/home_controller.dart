import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_clean_admin/constants/app_color.dart';
import 'package:smart_clean_admin/model/request_model.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<Request> requestList = [];
  late CollectionReference requestCollection;

  var pendingCount = 0.obs; // Change to int.obs instead of string.obs

  @override
  void onInit() {
    super.onInit();
    requestCollection = firestore.collection('requests');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchRequests();
    });
  }

  fetchRequests() async {
    try {
      QuerySnapshot requestsSnapshot = await requestCollection.get();
      print("Documents Found: ${requestsSnapshot.docs.length}");

      final List<Request> retrivedRequests = requestsSnapshot.docs
          .map((doc) => Request.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      requestList.clear();
      requestList.assignAll(retrivedRequests);

      // ✅ Count pending requests
      int pending = requestList
          .where((req) => req.status == "Pending")
          .length;
      pendingCount.value = pending; // Update the count

      print('Pending Requests: $pending');
    } catch (e) {
      debugPrint('Fetch Request Error: ' + e.toString());
    } finally {
      update();
    }
  }

  // help functions with small task
  // make capital letter
  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  // Status text color change
  Color getStatusTextColor(String? status) {
    switch (status?.toLowerCase().toLowerCase()) {
      case 'pending':
        return AppColor.pendingTextColor; // Pending - Orange
      case 'accepted':
        return AppColor.acceptedTextColor; // Accepted - Blue
      case 'completed':
        return AppColor.completedTextColor; // Completed - Green
      default:
        return Colors.grey; // Default - Grey
    }
  }

  Color getStatusBackgroundColor(String? status) {
    switch (status?.toLowerCase().toLowerCase()) {
      case 'pending':
        return AppColor.pendingBackgroundColor; // Pending - Orange
      case 'accepted':
        return AppColor.acceptBackgroundColor; // Accepted - Blue
      case 'completed':
        return AppColor.completeBackgroundColor; // Completed - Green
      default:
        return Colors.grey; // Default - Grey
    }
  }
}
