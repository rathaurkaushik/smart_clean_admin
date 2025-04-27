
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_clean_admin/model/request_model.dart';
import 'package:smart_clean_admin/utils/toast_maasage.dart';

class RequestController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var filter = 'All'.obs;

  late CollectionReference requestRef;
  List<Request> requestsList = [];

  @override
  void onInit() {
    requestRef = firestore.collection('requests');
    fetchReqList();  // 👈 Fetch on load
   // Just assign collection here
    super.onInit();
  }

  Future<void> fetchReqList() async {
    try {
      QuerySnapshot requestSnapshot = await requestRef.get(); // Apply ordering here

      print("Request List: ${requestSnapshot.docs.length}");

      final List<Request> retrivedRequestList = requestSnapshot.docs
          .map((doc) => Request.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList();

      requestsList.assignAll(retrivedRequestList);
      update();
    } catch (e) {
      print("Request error: $e");
      Utils().toastMessageWarning(e.toString());
    }
  }
Future<void> deleteRequest(String id) async{
try{
    DocumentSnapshot snapshot = await requestRef!.doc(id).get();
    if(snapshot.exists){
      await requestRef.doc(id).delete();
      Utils().toastMessageSimple("Request Rejected");
    }
    else {
      print("id not found");
    }
    }
    catch(e){
  Utils().toastMessageWarning("Error in id fetch");
    }
    finally{
  Get.back();
      fetchReqList();
  update();
    }


}
  Future<void> submitRequest(String id) async {
    try {
      await requestRef.doc(id).update({
        'status': 'Completed',
        'submitAt': Timestamp.now(),
      });
      fetchReqList(); // refresh list
      Utils().toastMessageSimple("Request Submitted");
    } catch (e) {
      Utils().toastMessageWarning("Failed to submit request: $e");
    }finally{
      Get.back();
      fetchReqList();
      update();
    }
  }
  Future<void> acceptRequest(String id) async {
    try {
      await requestRef.doc(id).update({
        'status': 'Accepted',
        'acceptedAt': Timestamp.now(),
      });
      Utils().toastMessageSimple("Request Accepted");
      fetchReqList(); // Refresh list
    } catch (e) {
      Utils().toastMessageWarning("Failed to accept request: $e");
    }
    finally{
      Get.back();
      fetchReqList();
      update();
    }
  }

  void fetchFilteredReqList(String status) async {
    try {
      QuerySnapshot requestSnapshot;

      // Choose query based on filter
      if (status == 'All') {
        requestSnapshot = await requestRef.get();
      } else {
        requestSnapshot = await requestRef
            .where('status', isEqualTo: status)
            .get();
      }

      final List<Request> retrievedRequestList = requestSnapshot.docs
          .map((doc) =>
          Request.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList();

      requestsList = retrievedRequestList;
      update(); // 👈 ensures GetBuilder rebuilds

      print("Filtered Requests (${status}): ${requestsList.length}");
    } catch (e) {
      print("Error fetching filtered requests: $e");
      Utils().toastMessageWarning("Failed to fetch $status requests");
    }
  }


}
