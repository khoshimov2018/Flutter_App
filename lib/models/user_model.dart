// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.buyer,
  });

  Buyer buyer;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    buyer: Buyer.fromJson(json["buyer"]),
  );

  Map<String, dynamic> toJson() => {
    "buyer": buyer.toJson(),
  };
}

class Buyer {
  Buyer({
    this.id,
    this.phone,
    this.password,
    this.allAgreed,
    this.termsOfService,
    this.createAt,
    this.logoutAt,
    this.lastLogin,
    this.language,
  });

  int id;
  String phone;
  String password;
  bool allAgreed;
  bool termsOfService;
  DateTime createAt;
  DateTime logoutAt;
  DateTime lastLogin;
  String language;

  factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
    id: json["id"],
    phone: json["phone"],
    password: json["password"],
    allAgreed: json["all_agreed"],
    termsOfService: json["terms_of_service"],
    createAt: DateTime.parse(json["createAt"]),
    logoutAt: DateTime.parse(json["logoutAt"]),
    lastLogin: DateTime.parse(json["lastLogin"]),
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone": phone,
    "password": password,
    "all_agreed": allAgreed,
    "terms_of_service": termsOfService,
    "createAt": "${createAt.year.toString().padLeft(4, '0')}-${createAt.month.toString().padLeft(2, '0')}-${createAt.day.toString().padLeft(2, '0')}",
    "logoutAt": "${logoutAt.year.toString().padLeft(4, '0')}-${logoutAt.month.toString().padLeft(2, '0')}-${logoutAt.day.toString().padLeft(2, '0')}",
    "lastLogin": "${lastLogin.year.toString().padLeft(4, '0')}-${lastLogin.month.toString().padLeft(2, '0')}-${lastLogin.day.toString().padLeft(2, '0')}",
    "language": language,
  };
}
