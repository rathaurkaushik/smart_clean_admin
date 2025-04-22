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
    return GetBuilder<RequestController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: const Text("Request Details")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("User Details",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),

                        _buildDetailRow("Name:",
                            "${request.name.toString()} ${request.surname.toString()}"),
                        _buildDetailRow("Phone:",
                            request.phone.toString()),
                        _buildDetailRow("Status:",
                            request.status.toString()),
                        _buildDetailRow(
                            "Created At",
                            DateFormat('d MMMM, h:mm a')
                                .format(request.createdAt!)),
                        const Divider(height: 32),
                        Text(request.address.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        // _buildDetailRow(
                        //     "Latitude:", request.latitude.toString()),
                        // _buildDetailRow(
                        //     "Longitude:", request.longitude.toString()),
                        const Divider(height: 32),
                        const Text("Photo",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        request.photos.toString().isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                request.photos!,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Text("No image available"),

                  ]
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$label ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
