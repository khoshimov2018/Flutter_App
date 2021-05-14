import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:picknpay/constant/api_utils.dart';
import 'package:picknpay/controller/home_controller.dart';
import 'package:picknpay/controller/login_controller.dart';


Future logoutService({bool logout, bool buyer}) async {
  GetStorage box = GetStorage();

  LoginController lC = Get.put(LoginController());
  HomeController hC = Get.put(HomeController());
  String body = '''{"language": "${hC.lang.value}","logout": "$logout"}''';
  print(box.read("buyer"));
  if(box.read("buyer")){
    var response = await http.put(
      "${ApiUtils.baseUrl}/buyers?phone=${lC.userModel.value.buyer.phone}&password=${lC.userModel.value.buyer.password}",
      headers:  {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }else{
    var response = await http.put(
      "${ApiUtils.baseUrl}/sellers?phone=01045750622&password=coolhand",
      headers:  {"Content-Type": "application/json"},
      body: body,
    );
    print(response.statusCode);
  if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }




}
