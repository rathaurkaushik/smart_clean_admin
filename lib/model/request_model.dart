import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  String? id;
  String? name;
  String? surname;
  String? address;
  String? status;
  DateTime? createdAt;
  DateTime? acceptedAt;
  DateTime? completedAt;

  Request({
    this.id,
    this.name,
    this.surname,
    this.address,
    this.status,
    this.createdAt,
    this.acceptedAt,
    this.completedAt,
  });

  // Convert Firestore JSON to Model
  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      address: json['address'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate() // ✅ Convert Timestamp to DateTime
          : null,
      acceptedAt: json['acceptedAt'] != null
          ? (json['acceptedAt'] as Timestamp).toDate() // ✅ Convert Timestamp to DateTime
          : null,
      completedAt: json['completedAt'] != null
          ? (json['completedAt'] as Timestamp).toDate() // ✅ Convert Timestamp to DateTime
          : null,
    );
  }

  // Convert Model to Firestore JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'address': address,
      'status': status,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!) // ✅ Convert DateTime to Timestamp
          : null,
      'acceptedAt': acceptedAt != null
          ? Timestamp.fromDate(acceptedAt!) // ✅ Convert DateTime to Timestamp
          : null,
      'completedAt': completedAt != null
          ? Timestamp.fromDate(completedAt!) // ✅ Convert DateTime to Timestamp
          : null,
    };
  }
}
