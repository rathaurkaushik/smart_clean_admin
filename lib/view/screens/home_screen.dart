import 'package:flutter/material.dart';
import 'package:smart_clean_admin/lists/list.dart';
import 'package:smart_clean_admin/view/widget/buttons.dart';
import 'package:smart_clean_admin/view/widget/cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    Color colorForRButton = Colors.white;
    final ValueNotifier<String> selectedCategory = ValueNotifier<String>(
        'all requests');

    return Scaffold(
        appBar: AppBar(
        title: Text('welcome')
    ,
    )
    ,
    backgroundColor
    :
    Colors
    .
    black12
    ,
    body
    :
    SafeArea
    (
    child
    :
    ListView
    (
    padding
    :
    EdgeInsets
    .
    zero
    ,
    children
    :
    [
    // --------------Container is temporary
    Container
    (
    // width: screenHeight * 0.4,
    height
    :
    screenHeight * 0.4,
    ),
    SizedBox(height: 10,),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    customeCards(context,
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text: "Today's Request\n"
    ),
    TextSpan(
    text: "24\n",
    style: TextStyle(color: Colors.blue),
    ),
    TextSpan(
    text: "12% from yesterday"
    )
    ]
    ),
    ),
    80,//minimum width
    screenWidth * 0.5, // maximum width
    90, // minimum height
    screenHeight * 0.2, //maximum height
    Colors.white
    ),
    customeCards(context,
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text: "Pending\n"
    ),
    TextSpan(
    text: "8\n",
    style: TextStyle(color: Colors.red),
    ),
    TextSpan(
    text: "Needs attention"
    )
    ]
    ),
    ),
    130, //minimum width
    screenWidth * 0.6, //max width
    90, //min height
    screenHeight * 0.2, //max height
    Colors.white

    ),
    ],
    ),
    SizedBox(height: 10),
    //----------------------------------- Recent Requests
    Text('  Recent Request', style: TextStyle(fontWeight: FontWeight.bold)),
    ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: Requests.requests.length,
    itemBuilder: (context,index){
    final request = Requests.requests[index];
    return customeCards(
    context,
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Icon(request.dp as IconData?,size: 35,),
    Text('${request.name}\n${request.time}',style: TextStyle(fontSize: 12),),
    ],
    ),
    Container(
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: request.status == 'pending' ? Colors.orangeAccent : Colors.greenAccent,
    ),
    child:
    Text('${request.status}',
    style: TextStyle(color: request.status == 'pending' ? Colors.deepOrange : Colors.green,fontSize: 10)),
    )
    ],
    ),
    Text('${request.address}',style: TextStyle(fontSize: 12,color: Colors.grey,),overflow: TextOverflow.ellipsis,maxLines: 1,),
    ],
    ),
    screenWidth * 0.2, screenWidth * 0.4, 60, 80, Colors.white
    );
    }
    ),
    SizedBox(height: 10,),
    //---------------------------------Monthly Overview
    Text('  Monthly Overview',style: TextStyle(fontWeight: FontWeight.bold,),),
    customeCards(context,
    Column(
    // mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text: 'Total Request\n',style: TextStyle(fontWeight: FontWeight.w100)
    ),
    TextSpan(
    text: '342'
    )
    ]
    )
    ),
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text: 'Completion Rate\n',style: TextStyle(fontWeight: FontWeight.w100)
    ),
    TextSpan(
    text: '95%',style: TextStyle(color: Colors.green)
    )
    ]
    )
    ),
    ],
    ),
    // ------progressbar
    ],
    ),
    screenWidth * 0.2, screenWidth * 0.4, 60, 80, Colors.white
    ),
    // ---------------------Quick Action
    SizedBox(height: 10,),
    Text('  Quick Action',style: TextStyle(fontWeight: FontWeight.bold),),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    customeCards(context,
    Container(
    color: Colors.blue,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Icon(Icons.event_note),
    Text('View All Request',style: TextStyle(fontSize: 13,color: Colors.white),)
    ],
    ),
    ],
    ),
    ),
    90,//minimum width
    screenWidth * 0.5, // maximum width
    40, // minimum height
    100, //maximum height
    Colors.blue
    ),
    customeCards(context,
    Container(
    color: Colors.green,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Icon(Icons.bar_chart_sharp),
    Text('View Statistics',style: TextStyle(fontSize: 13,color: Colors.white),),
    ],
    ),
    ],
    ),
    ),
    90,//minimum width
    screenWidth * 0.5, // maximum width
    40, // minimum height
    100, //maximum height
    Colors.green
    ),
    ],
    ),
    SizedBox(height: 10,),
    // -----------------Requests
    RequestButtons(context,selectedCategory),
    SizedBox(height: 5),
    Expanded(
    child: ValueListenableBuilder<String>(
    valueListenable: selectedCategory,
    builder: (context, currentCategory, child) {
    List<RecentRequest> filteredRequests = Requests.requests;
    if (currentCategory != "all requests") {
    filteredRequests = Requests.requests.where((request) => request.status.toLowerCase() == currentCategory).toList();
    }
    return ListView.builder(
    itemCount: filteredRequests.length,
    itemBuilder: (context, index) {
    var request = filteredRequests[index];
    return customeCards(context,
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Icon(request.dp, size: 35),
    SizedBox(width: 8),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(request.name, style: TextStyle(fontSize: 14)),
    Text(request.time, style: TextStyle(fontSize: 12, color: Colors.grey)),
    ],
    ),
    ],
    ),
    Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: request.status == 'pending' ? Colors.redAccent : Colors.greenAccent,
    ),
    child: Text(
    request.status,
    style: TextStyle(
    color: request.status == 'pending' ? Colors.white : Colors.green,
    fontSize: 10,
    ),
    ),
    ),
    ],
    ),
    SizedBox(height: 5),
    Text(
    request.address,
    style: TextStyle(fontSize: 12),
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    ),
    ],
    ),
    screenWidth * 0.2, screenWidth * 0.4, 60, 80, Colors.white,
    );
    },
    );
    },
    ),
    ),
    ],
    ),
    );
  }
}


