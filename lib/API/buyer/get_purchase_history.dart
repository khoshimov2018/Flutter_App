import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:picknpay/constant/api_utils.dart';
import 'package:picknpay/controller/buyer_controller.dart';
import 'package:picknpay/controller/login_controller.dart';

getPurchaseHistory() async {
  LoginController lC = Get.put(LoginController());
  lC.loading.value = true;
  BuyerController bC = Get.put(BuyerController());
  var response = await http.get(
      "${ApiUtils.baseUrl}/items?admin=9054f7aa9305e012b3c2300408c3dfdf390fcddf");
  var decodedData = jsonDecode(response.body);
  List listOfItems = decodedData["items"];
  listOfItems.forEach((element) {
    if (element["buyer"] == lC.userId.value) {
      bC.userPurchasedItem.add(element);
    }
  });
  lC.loading.value = false;
}
