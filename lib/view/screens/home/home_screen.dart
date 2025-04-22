import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smart_clean_admin/constants/app_color.dart';
import 'package:smart_clean_admin/utils/first_letter.dart';
import 'package:smart_clean_admin/view/screens/home/home_controller.dart';
import 'package:intl/intl.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh:()=> ctrl.fetchRequests(),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Update pending requests
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Today request
                      SizedBox(
                        width: screenWidth * 0.45,
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  'Today\'s Requests',
                                  style: TextStyle(
                                      color: AppColor.grayTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  ctrl.requestList.length.toString(),
                                  style: TextStyle(
                                      color: AppColor.numberHeighlightedColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      //pending
                      SizedBox(
                        width: screenWidth * 0.45,
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  'Pending',
                                  style: TextStyle(
                                      color: AppColor.grayTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Obx(() => Text(
                                      ctrl.pendingCount.toString(),
                                      style: TextStyle(
                                          color: AppColor.warningColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //All Requests Fields

                  Text(
                    'Recent Requests',
                    style: TextStyle(
                        color: AppColor.appBlackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: ctrl.requestList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(spacing: 10, children: [
                                      CircleAvatar(
                                          child: Image(
                                              image: AssetImage(
                                                  'assets/images/man.png'))),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${capitalize(ctrl.requestList[index].name.toString())}${ctrl.requestList[index].surname.toString()}',
                                            style: TextStyle(
                                                color: AppColor.simpleTextColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            DateFormat('dd/MMM, hh:mm a').format(
                                                ctrl.requestList[index]
                                                    .createdAt!),
                                            style: TextStyle(
                                                color: AppColor.grayTextColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: ctrl.getStatusBackgroundColor(ctrl.requestList[index].status.toString()),
                                        ),

                                        child: Text(
                                          ctrl.requestList[index].status.toString(),
                                          style: TextStyle(
                                              color: ctrl.getStatusTextColor(ctrl.requestList[index].status),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  ctrl.requestList[index].address.toString(),
                                  style: TextStyle(
                                      color: AppColor.grayTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
