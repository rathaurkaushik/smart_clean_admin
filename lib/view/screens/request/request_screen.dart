import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_clean_admin/view/screens/request/detail_req_screen.dart';
import 'package:smart_clean_admin/view/screens/request/request_controller.dart';
import 'package:smart_clean_admin/view/widgets/request_card.dart';

class RequestScreen extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () => ctrl.fetchReqList(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              children: [
                // const SizedBox(height: 10),
                Obx(() => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: ['All', 'Pending', 'Completed'].map((status) {
                          return ChoiceChip(
                            label: Text(status),
                            selected: ctrl.filter.value == status,
                            onSelected: (_) {
                              ctrl.filter.value = status;
                              ctrl.fetchFilteredReqList(
                                  status); // Fetch filtered list based on status
                            },
                            selectedColor: Colors.green.shade100,
                            labelStyle: TextStyle(
                              color: ctrl.filter.value == status
                                  ? Colors.green
                                  : Colors.black,
                            ),
                          );
                        }).toList(),
                      ),
                    )),
                const SizedBox(height: 10),
                Expanded(
                    child: ListView.builder(
                  itemCount: ctrl.requestsList.length,
                  itemBuilder: (context, index) {
                    final req = ctrl.requestsList[index];
                    return RequestCard(
                      name: '${req.name.toString()} ${req.surname}',
                      phone: req.phone.toString(),
                      status: req.status.toString(),
                      time: DateFormat('d MMMM, h:mm a').format(req.createdAt!),
                      onTap: (){

                        Get.to(()=> DetailReqScreen(request: req));
                      },
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
