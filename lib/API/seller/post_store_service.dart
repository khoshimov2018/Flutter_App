import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:picknpay/constant/api_utils.dart';
import 'package:picknpay/controller/login_controller.dart';


Future postStoreService(String registerNumber, String storeName,
    String bankName, String bankAcNumber) async {
  LoginController lC = Get.put(LoginController());
  String body = '''{"name":"$storeName","QRCODE":"2025","bank_name":"$bankName","account_number":"$bankAcNumber","registration_number":"$registerNumber"}''';

  var response = await http.post("${ApiUtils.baseUrl}/store/${lC.userId.value}",
      headers: {"Content-Type": "application/json"}, body: body);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
