import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_clean_admin/model/request_model.dart';
import 'package:smart_clean_admin/constants/app_color.dart';
import 'package:smart_clean_admin/view/screens/request/request_controller.dart';

class DetailReqScreen extends StatelessWidget {
  final Request request;
  const DetailReqScreen({super.key, required this.request});
  @override
  Widget build(BuildContext context) {
    print("Image         : ${request.photos.toString()}");
    return GetBuilder<RequestController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: const Text("Request Details")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionCard("User Details", [
                  _buildDetailRow("Name", request.name ?? "N/A"),
                  _buildDetailRow("Phone", request.phone ?? "N/A"),
                  _buildDetailRow("Status", request.status ?? "N/A"),
                  _buildDetailRow(
                      "Created At",
                      request.createdAt != null
                          ? DateFormat('d MMMM, h:mm a').format(request.createdAt!)
                          : "N/A"),
                  if (request.acceptedAt != null)
                    _buildDetailRow(
                        "Accepted At",
                        DateFormat('d MMMM, h:mm a').format(request.acceptedAt!)
                    ),
                ]),
                const SizedBox(height: 16),
                _sectionCard("Address", [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      request.address ?? "N/A",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ]),
                const SizedBox(height: 16),
                _sectionCard("Photo", [

              request.photos != null && request.photos!.isNotEmpty
                      ?
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                    Image.network(
request.photos!                      ,height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator(color: AppColor.appBarColor,));
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Text("Failed to load image"));
                      },
                    ),
                  )

                      : Image.network(
          "https://firebasestorage.googleapis.com/v0/b/smart-clean-admin.firebasestorage.app/o/photos%2F1745447667191.jpg?alt=media&token=3ac9feed-5e9e-4bf8-ab1a-ed5fe063abf8"
          ,height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator(color: AppColor.appBarColor,));
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text("Failed to load image"));
          },
        ),
                ]),
                const SizedBox(height: 24),

                if (request.status == 'Pending')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          ctrl.deleteRequest(request.id ?? "no-id");
                        },
                        icon: const Icon(Icons.close, color: Colors.red),
                        label: const Text("Reject", style: TextStyle(color: Colors.red)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          ctrl.acceptRequest(request.id ?? "no-id");
                        },
                        icon: const Icon(Icons.check),
                        label: const Text(
                          "Accept",
                          style: TextStyle(color: AppColor.appWhiteColor),
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      ),
                    ],
                  )
                else if (request.status == 'Accepted')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          ctrl.deleteRequest(request.id ?? "no-id");
                        },
                        icon: const Icon(Icons.close, color: Colors.red),
                        label: const Text("Reject", style: TextStyle(color: Colors.red)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          ctrl.submitRequest(request.id ?? "no-id");
                        },
                        icon: const Icon(Icons.done),
                        label: const Text("Submit", style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }

  Widget _sectionCard(String title, List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}
