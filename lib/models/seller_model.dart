// To parse this JSON data, do
//
//     final sellerModel = sellerModelFromJson(jsonString);

import 'dart:convert';

SellerModel sellerModelFromJson(String str) => SellerModel.fromJson(json.decode(str));

String sellerModelToJson(SellerModel data) => json.encode(data.toJson());

class SellerModel {
  SellerModel({
    this.seller,
  });

  Seller seller;

  factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
    seller: Seller.fromJson(json["seller"]),
  );

  Map<String, dynamic> toJson() => {
    "seller": seller.toJson(),
  };
}

class Seller {
  Seller({
    this.id,
    this.phone,
    this.password,
    this.registrationNumber,
    this.businessName,
    this.bank,
    this.accountNumber,
    this.qrcode,
    this.allAgreed,
    this.termsOfService,
    this.createAt,
    this.lastLogin,
    this.logoutAt,
    this.language,
  });

  int id;
  String phone;
  String password;
  String registrationNumber;
  String businessName;
  String bank;
  String accountNumber;
  String qrcode;
  bool allAgreed;
  bool termsOfService;
  DateTime createAt;
  DateTime lastLogin;
  DateTime logoutAt;
  String language;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
    id: json["id"],
    phone: json["phone"],
    password: json["password"],
    registrationNumber: json["registration_number"],
    businessName: json["business_name"],
    bank: json["bank"],
    accountNumber: json["account_number"],
    qrcode: json["QRCODE"],
    allAgreed: json["all_agreed"],
    termsOfService: json["terms_of_service"],
    createAt: DateTime.parse(json["createAt"]),
    lastLogin: DateTime.parse(json["lastLogin"]),
    logoutAt: DateTime.parse(json["logoutAt"]),
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone": phone,
    "password": password,
    "registration_number": registrationNumber,
    "business_name": businessName,
    "bank": bank,
    "account_number": accountNumber,
    "QRCODE": qrcode,
    "all_agreed": allAgreed,
    "terms_of_service": termsOfService,
    "createAt": "${createAt.year.toString().padLeft(4, '0')}-${createAt.month.toString().padLeft(2, '0')}-${createAt.day.toString().padLeft(2, '0')}",
    "lastLogin": "${lastLogin.year.toString().padLeft(4, '0')}-${lastLogin.month.toString().padLeft(2, '0')}-${lastLogin.day.toString().padLeft(2, '0')}",
    "logoutAt": "${logoutAt.year.toString().padLeft(4, '0')}-${logoutAt.month.toString().padLeft(2, '0')}-${logoutAt.day.toString().padLeft(2, '0')}",
    "language": language,
  };
}
