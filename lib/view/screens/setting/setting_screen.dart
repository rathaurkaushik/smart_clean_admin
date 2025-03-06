

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('setting')),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: SingleChildScrollView(
              child: Column(
                spacing: 0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child: Image(image: AssetImage('assets/images/man.png')),
                              ),
                              RichText(text: TextSpan(children: [
                                TextSpan(text: 'David Wilson\n',style: TextStyle(fontSize: 16)),
                                TextSpan(text: 'Edit profile information',style: TextStyle(fontSize: 15,color: AppColor.simpleTextColor))
                              ])),
                            ],
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.navigate_next,color: AppColor.simpleTextColor,))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Notification',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          child: Row(spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.lightBlue[200],
                                  ),
                                  child: Icon(CupertinoIcons.bell,color: Colors.blue,),
                                ),
                                SizedBox(width: 2),
                                RichText(text: TextSpan(children: [
                                  TextSpan(text: 'Push Notification\n',style: TextStyle(fontSize: 15)),
                                  TextSpan(text: 'For new requests and updates',style: TextStyle(color: AppColor.simpleTextColor,fontSize: 14))
                                ]))
                              ],),
                              Icon(Icons.toggle_off_outlined,color: Colors.grey,size: 30,)
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Icon(Icons.email_outlined,color: Colors.green,)
                                  ),
                                  SizedBox(width: 2),
                                  RichText(text: TextSpan(children: [
                                    TextSpan(text: 'Email Notification\n',style: TextStyle(fontSize: 15)),
                                    TextSpan(text: 'Daily summary and reports',style: TextStyle(color: AppColor.simpleTextColor,fontSize: 14))
                                  ]))
                                ],
                              ),
                              Icon(Icons.toggle_off_outlined,size: 30,color: Colors.grey,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('App Settings',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 10,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.purple[100],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Icon(Icons.thumbs_up_down,color: Colors.purple,)
                              ),
                              SizedBox(width: 2),
                              RichText(text: TextSpan(children: [
                                TextSpan(text: 'Preference\n',style: TextStyle(fontSize: 15)),
                                TextSpan(text: 'Language and region',style: TextStyle(color: AppColor.simpleTextColor,fontSize: 14))
                              ]))
                            ],
                          ),
                          Icon(Icons.navigate_next,size: 30,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 10,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow[200],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Icon(CupertinoIcons.moon,color: Colors.yellow,)
                              ),
                              SizedBox(width: 2),
                              RichText(text: TextSpan(children: [
                                TextSpan(text: 'Dark Mode\n',style: TextStyle(fontSize: 15)),
                                TextSpan(text: 'Language and region',style: TextStyle(color: AppColor.simpleTextColor,fontSize: 14))
                              ]))
                            ],
                          ),
                          Icon(Icons.toggle_off_outlined,size: 30,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Help & Support',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 10,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.red[100],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Icon(Icons.error_outline,color: Colors.red,)
                              ),
                              SizedBox(width: 2),
                              RichText(text: TextSpan(children: [
                                TextSpan(text: 'Help Center\n',style: TextStyle(fontSize: 15)),
                                TextSpan(text: 'FAQs and support',style: TextStyle(color: AppColor.simpleTextColor,fontSize: 14))
                              ]))
                            ],
                          ),
                          Icon(Icons.navigate_next,size: 30,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 10,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Icon(CupertinoIcons.question_circle)
                              ),
                              SizedBox(width: 2),
                              RichText(text: TextSpan(children: [
                                TextSpan(text: 'About App\n',style: TextStyle(fontSize: 15)),
                                TextSpan(text: 'Version 1.0.0',style: TextStyle(color: AppColor.simpleTextColor,fontSize: 14))
                              ]))
                            ],
                          ),
                          Icon(Icons.navigate_next,size: 30,color: Colors.grey,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
