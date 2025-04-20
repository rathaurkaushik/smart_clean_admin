import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_color.dart';

class LocationTrackingScreen extends StatelessWidget {
  const LocationTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text('Location Tracking',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: Get.height * 0.4,
                width: Get.width * 0.94,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.acceptBackgroundColor
                ),
                child: Icon(Icons.location_on_outlined,color: AppColor.acceptedTextColor,size: 70,)
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 15),
              color: Colors.white,
              child: Container(
                width: Get.width * 0.94,
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.acceptBackgroundColor,
                      ),
                      child: Icon(Icons.location_on_outlined,color: Colors.green,size: 25,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('  Current Location',style: TextStyle(fontSize: 14,color: AppColor.grayTextColor)),
                        Text('  123 Main Street, City Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
                        Text('  Lat: 12.3456, Long: 78.9012',style: TextStyle(fontSize: 14,color: AppColor.grayTextColor),)
                      ],
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.restart_alt_rounded,color: AppColor.acceptedTextColor,size: 35,)
                    )
                  ],
                ),
              ),
            ),
            //--------------------Tracking Status
            Card(
              margin: EdgeInsets.only(top: 15),
              color: Colors.white,
              child: Container(
                width: Get.width * 0.94,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tracking Status',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.acceptBackgroundColor
                          ),
                          child: Text('Active',style: TextStyle(color: AppColor.acceptedTextColor),),
                        )
                      ],
                    ),
                    Text('🟢  Location accuracy : {High}'),
                    Text('🟢  GPS Signal : {Strong}'),
                  ],
                ),
              ),
            ),
            //-----------------------Button
            Container(
              width: Get.width * 0.94,
              padding: EdgeInsets.all(13),
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.acceptedTextColor
              ),
              child: Center(child: Text('✓  Confirm Location',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),)),
            )
          ],
        ),
      ),
    );
  }
}
