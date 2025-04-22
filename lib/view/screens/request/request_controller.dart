import 'package:cloud_firestore/cloud_firestore.dart';
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
    fetchReqList();  // 👈 Fetch on load
    requestRef = firestore.collection('requests'); // Just assign collection here
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
