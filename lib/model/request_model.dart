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
    this.uid
  });

  // Convert Firestore JSON to Model
  factory Request.fromJson(Map<String, dynamic> json, String docId) {
    return Request(
      id: docId, // Use Firestore document ID
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      photos: json['photos'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : null,
      acceptedAt: json['acceptedAt'] != null
          ? (json['acceptedAt'] as Timestamp).toDate()
          : null,
      completedAt: json['completedAt'] != null
          ? (json['completedAt'] as Timestamp).toDate()
          : null,
      uid: json['uid'] as String
    );
  }

}
