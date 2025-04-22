class UsersModel {
  String? email;
  String? name;
  String? surname;
  String? number;
  String? uid;

  //constructor
  UsersModel({this.uid, this.name, this.surname, this.number, this.email});

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
        uid: json['uid'] as String?,
        name: json['name'] as String?,
        surname: json['surname'] as String?,
        number: json['number'] as String?,
        email: json['email'] as String?);
  }
}
