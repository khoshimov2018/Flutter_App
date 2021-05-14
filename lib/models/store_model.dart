// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';

StoreModel storeModelFromJson(String str) => StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
  StoreModel({
    this.store,
  });

  List<Store> store;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    store: List<Store>.from(json["store"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "store": List<dynamic>.from(store.map((x) => x.toJson())),
  };
}

class Store {
  Store({
    this.name,
    this.qrcode,
    this.bankName,
    this.accountNumber,
    this.registrationNumber,
  });

  String name;
  String qrcode;
  String bankName;
  String accountNumber;
  String registrationNumber;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    name: json["name"],
    qrcode: json["QRCODE"],
    bankName: json["bank_name"],
    accountNumber: json["account_number"],
    registrationNumber: json["registration_number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "QRCODE": qrcode,
    "bank_name": bankName,
    "account_number": accountNumber,
    "registration_number": registrationNumber,
  };
}
