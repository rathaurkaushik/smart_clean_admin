import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  String? id;
  String? name;
  String? surname;
  String? address;
  String? phone;
  String? photos;
  String? status;
  DateTime? createdAt;
  DateTime? acceptedAt;
  DateTime? completedAt;
  String? uid;

  Request({
    this.id,
    this.name,
    this.surname,
    this.address,
    this.phone,
    this.photos,
    this.status,
    this.createdAt,
    this.acceptedAt,
    this.completedAt,
    this.uid,
  });

  // Helper to parse both Timestamp and String to DateTime
  static DateTime? parseDate(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  // Convert Firestore JSON to Model
  factory Request.fromJson(Map<String, dynamic> json, String docId) {
    return Request(
      id: docId,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      photos: json['photos'] as String?,
      status: json['status'] as String?,
      createdAt: parseDate(json['createdAt']),
      acceptedAt: parseDate(json['acceptedAt']),
      completedAt: parseDate(json['completedAt']),
      uid: json['uid'] as String?,
    );
  }
}
