import 'package:flutter/material.dart';
import 'package:smart_clean_admin/view/widget/cards.dart';
import '../../lists/list.dart';

Widget RequestButtons(BuildContext context, List<String> buttonTiles) {
  double screenWidth = MediaQuery.of(context).size.width;

  final ValueNotifier<int> buttonIndex = ValueNotifier<int>(0);

  return Column(
    children: [
      // Category Buttons
      ValueListenableBuilder<int>(
        valueListenable: buttonIndex,
        builder: (context, currentIndex, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(buttonTiles.length, (index) {
                return GestureDetector(
                  onTap: () {
                    buttonIndex.value = index;
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: currentIndex == index ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      buttonTiles[index],
                      style: TextStyle(
                        color: currentIndex == index ? Colors.white : Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
      const SizedBox(height: 3),

      // Filtered Request List
      ValueListenableBuilder<int>(
        valueListenable: buttonIndex,
        builder: (context, currentIndex, child) {
          String selectedCategory = buttonTiles[currentIndex].toLowerCase();
          List<RecentRequest> filteredRequests;

          if (selectedCategory == "all requests") {
            filteredRequests = Requests.requests;
          } else {
            filteredRequests = Requests.requests
                .where((request) => request.status.toLowerCase() == selectedCategory)
                .toList();
          }
          return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: filteredRequests.map((request) {
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
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: request.status == 'pending' ? Colors.orangeAccent : Colors.greenAccent,
                          ),
                          child: Text(
                            request.status,
                            style: TextStyle(
                              color: request.status == 'pending' ? Colors.deepOrange : Colors.green,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      request.address,
                      style: TextStyle(fontSize: 12,color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                screenWidth * 0.4,
                screenWidth,
                60, 100, Colors.white,
              );
            }).toList(),
          );
        },
      ),
    ],
  );
}
