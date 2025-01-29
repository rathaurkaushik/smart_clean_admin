import 'package:flutter/material.dart';
import 'package:smart_clean_admin/view/widget/cards.dart';

class RecentRequest{
  final IconData dp;
  final String name;
  final String time;
  final String address;
  final String status; // accepted or pending

  RecentRequest({required this.dp, required this.name, required this.time, required this.address, required this.status});
}

class Requests{
  static IconData icn = (Icons.account_circle_outlined);
  static List<RecentRequest> requests = [
    RecentRequest(
        dp: icn,
        name: 'John Smith',
        time: '2 mins ago',
        address: '123 main Street, Downtown',
        status: 'pending'
    ),
    RecentRequest(
        dp: icn,
        name: 'Sarah Johnson',
        time: '15 mins ago',
        address: '456 parkAvenue',
        status: 'accepted'
    ),
    RecentRequest(
        dp: icn,
        name: 'Bg sabhani',
        time: '2 hours ago',
        address: 'vaishnovdevi, s.p ringroad',
        status: 'pending'
    ),
    RecentRequest(
        dp: icn,
        name: 'kaushik rathod',
        time: '10 mins ago',
        address: 'maninagar',
        status: "completed"
    ),
  ];
}

Widget filteredRequest(BuildContext context, String selectedCategory){
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  List<RecentRequest> filteredRequest = Requests.requests.where((requests) => requests.status == selectedCategory).toList();

  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredRequest.length,
      itemBuilder: (context,index){

    var requests = Requests.requests[index];
    late String selectedCategory;
    String catRequest = requests.status;
    switch(requests.status){
      case 'pending':
        catRequest = 'pending';
        break;
      case 'accepted':
        catRequest = 'accepted';
        break;
      case 'completed':
        catRequest = 'completed';
        break;
      // default:
      //   catRequest = Requests.requests[index];
      //   break;
    }
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
                    Icon(requests.dp as IconData?,size: 35,),
                    Text('${requests.name}\n ${requests.time}',style: TextStyle(fontSize: 12),),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.20),
                    color: Colors.lightGreenAccent,
                  ),
                  child: Text('${requests.status}',style: TextStyle(color: Colors.green,fontSize: 10)),
                )
              ],
            ),
            Text('${requests.address}',style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,maxLines: 1,),
          ],
        ),
        screenWidth * 0.2, screenWidth * 0.4, 60, 80, Colors.white
    );
  });
}
