import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_color.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Image(image: AssetImage('assets/images/man.png')),
        ),
        title: Column(
          children: [
            Text("Hello Jhon",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
            Text("Let's keep our city clean",style: TextStyle(color: Colors.white,fontSize: 12),)
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications_active_outlined,color: Colors.white)
          ),
          SizedBox(width: 15)
        ],
      ),
      body: Container(
        color: AppColor.completeBackgroundColor,
        child: Column(
          children: [
            // ----------- Report Waste and My Reports
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               GestureDetector(
                 onTap: (){},
                 child: Container(
                   alignment: Alignment.center,
                   height: Get.height * 0.16,
                   width: Get.width * 0.45,
                   margin: EdgeInsets.symmetric(vertical: 15),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     color: AppColor.appBarColor
                   ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.camera_alt_outlined,color: Colors.white,),
                       Text('Report Waste',style: TextStyle(color: Colors.white),)
                     ],
                   ),
                 ),
                 ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    height: Get.height * 0.16,
                    width: Get.width * 0.45,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.acceptBackgroundColor
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pending_actions_outlined,color: AppColor.acceptedTextColor,),
                        Text('My Reports',style: TextStyle(color: AppColor.acceptedTextColor),)
                      ],),
                  ),
                ),
              ],
            ),
            //-------------- Recent Activity
            Card(
              elevation: 2,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 8),
                    child: Text('Recent Activity',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 7,right: 7),
                    padding: EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.completeBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: AppColor.acceptBackgroundColor,
                          ),
                          child: Icon(Icons.check,color: Colors.green,size: 25,),
                        ),
                        RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Waste Collected\n',style: TextStyle(fontSize: 14)
                            ),
                            TextSpan(
                              text: '123 Main Street',style: TextStyle(fontSize: 12,color: AppColor.grayTextColor),
                            )
                          ]
                        )),
                        SizedBox(width: Get.width * 0.08,),
                        Text('2h ago',style: TextStyle(fontSize: 12,color: AppColor.grayTextColor),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.completeBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: AppColor.pendingBackgroundColor,
                          ),
                          child: Icon(Icons.watch_later_outlined,color: AppColor.pendingTextColor,size: 25,),
                        ),
                        RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Pending Collection\n',style: TextStyle(fontSize: 14)
                            ),
                            TextSpan(
                              text: '456 Park Avenue',style: TextStyle(fontSize: 12,color: AppColor.grayTextColor),
                            )
                          ]
                        )),
                        SizedBox(width: Get.width * 0.08,),
                        Text('5h ago',style: TextStyle(fontSize: 12,color: AppColor.grayTextColor),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //--------------------------Impact statistics
            Card(
              color: Colors.white,
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 0),
                    child: Text('Impact Statistics',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(top: 10),
                        width: Get.width * 0.45,
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.acceptBackgroundColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('12',style: TextStyle(fontSize: 18,color: AppColor.acceptedTextColor, fontWeight: FontWeight.w600)),
                          Text('Reports made',style: TextStyle(color: AppColor.grayTextColor,fontSize: 13)),
                        ],),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(top: 10),
                        width: Get.width * 0.45,
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.acceptBackgroundColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('8',style: TextStyle(fontSize: 18,color: AppColor.acceptedTextColor, fontWeight: FontWeight.w600)),
                          Text('Waste Collected',style: TextStyle(color: AppColor.grayTextColor,fontSize: 13)),
                        ],),
                      ),
                    ],
                  ),
                  SizedBox(height: 10)
                ],
              ),
            ),

        ],
      ),
      ),
    );
  }
}
