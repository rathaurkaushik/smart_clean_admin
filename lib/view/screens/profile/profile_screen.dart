
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
               Container(
                 color: Colors.blue,
                 width: screenWidth,
                 // height: screenHeight * 0.30,
                 child: Column(
                   children: [
                     CircleAvatar(
                       radius: 50,
                       backgroundColor: Colors.white,
                       child: Image(image: AssetImage('assets/images/man.png'))),
                     SizedBox(height: 1,),
                     Text('David Wilson',
                         style: TextStyle(
                         color: AppColor.appWhiteColor,
                         fontSize: 16,
                         fontWeight: FontWeight.w500)
                     ),
                     Text('Cleanup Provider',
                         style: TextStyle(
                         color: AppColor.appWhiteColor,
                         fontSize: 13,
                         )
                     ),
                     SizedBox(
                       width: screenWidth * 0.95,
                       child: Card(
                         elevation: 2,
                         color: Colors.white,
                         child: Padding(
                           padding: const EdgeInsets.all(11.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Column(children: [
                                 Text('156', style: TextStyle(fontSize: 18, color: Colors.blue,)),
                                 Text('Completed',style: TextStyle(fontSize: 11,color: AppColor.grayTextColor),)
                               ]),
                               Column(children: [
                                 Text('4.9', style: TextStyle(fontSize: 18, color: Colors.blue,)),
                                 Text('Rating',style: TextStyle(fontSize: 11,color: AppColor.grayTextColor),)
                               ],),
                               Column(children: [
                                 Text('98%', style: TextStyle(fontSize: 18, color: Colors.blue,)),
                                 Text('Success',style: TextStyle(fontSize: 11,color: AppColor.grayTextColor),)
                               ],)
                             ],
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(height: 5),
               SizedBox(
                 width: screenWidth * 0.95,
                 child: Card(
                   elevation: 2,
                   color: Colors.white,
                   child: Padding(
                     padding: const EdgeInsets.all(11.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Personal Information',style: TextStyle(fontSize: 15,),),
                         SizedBox(height: 11),
                         Row(
                           children: [
                             Icon(Icons.email_outlined,size: 16,),
                             RichText(text: TextSpan(children: [
                               TextSpan(text: 'Email\n',style: TextStyle(color: AppColor.grayTextColor,fontSize: 11)),
                               TextSpan(text: 'david.wolson@example.com',style: TextStyle(fontSize: 12)),
                             ])),
                           ],
                         ),
                         SizedBox(height: 8),
                         Row(
                           children: [
                             Icon(CupertinoIcons.phone,size: 16,),
                             RichText(text: TextSpan(children: [
                               TextSpan(text: 'Phone\n',style: TextStyle(color: AppColor.grayTextColor,fontSize: 11)),
                               TextSpan(text: '+1 234 459 580',style: TextStyle(fontSize: 12)),
                             ])),
                           ],
                         ),
                         SizedBox(height: 8),
                         Row(
                           children: [
                             Icon(Icons.location_on_outlined,size: 16,),
                             RichText(text: TextSpan(children: [
                               TextSpan(text: 'Location\n',style: TextStyle(color: AppColor.grayTextColor,fontSize: 11)),
                               TextSpan(text: 'New York, USA',style: TextStyle(fontSize: 12)),
                             ])),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 5),
               SizedBox(
                 width: screenWidth * .95,
                 child: Card(
                   elevation: 2,
                   color: Colors.white,
                   child: Padding(
                     padding: const EdgeInsets.all(11.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Performance',style: TextStyle(fontSize: 15),),
                         SizedBox(height: 11),
                         Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('Response Rate',style: TextStyle(fontSize: 13)),
                               Text('98%',style: TextStyle(fontSize: 13)),
                             ]
                         ),
                         SizedBox(height: 4),
                         SizedBox(
                           height: 6,
                           child: LinearProgressIndicator(
                             borderRadius: BorderRadius.circular(12),
                             value: 0.98,
                             backgroundColor: Colors.grey[300],
                             valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                           ),
                         ),
                         SizedBox(height: 4),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Completion Rate',style: TextStyle(fontSize: 13)),
                             Text('95%',style: TextStyle(fontSize: 13))
                           ],
                         ),
                         SizedBox(height: 4),
                         SizedBox(height: 6,
                           child: LinearProgressIndicator(
                             borderRadius: BorderRadius.circular(12),
                             value: 0.95,
                             backgroundColor: Colors.grey[300],
                             valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 5),
               SizedBox(
                 width: screenWidth * 0.95,
                 child: Card(
                   elevation: 1,
                   color: Colors.white38,
                   child: Padding(
                     padding: const EdgeInsets.all(8),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(CupertinoIcons.delete),
                         Text('Reset Account'),
                       ],
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 width: screenWidth * 0.95,
                 child: Card(
                   elevation: 1,
                   color: Colors.red,
                   child: Padding(
                     padding: const EdgeInsets.all(8),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(Icons.logout,color: Colors.white,),
                         Text('Logout',style: TextStyle(color: Colors.white)),
                       ],
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     );
   }
 }