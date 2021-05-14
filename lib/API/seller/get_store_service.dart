import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:picknpay/constant/api_utils.dart';
import 'package:picknpay/controller/login_controller.dart';
import 'package:picknpay/controller/seller_controller.dart';
import 'package:picknpay/models/store_model.dart';
import 'package:picknpay/widgets/my_snackbar.dart';
Future getStoreService()async{
  LoginController lC = Get.put(LoginController());
  SellerController sellerController = Get.put(SellerController());
  print(lC.userId.value);

  var response = await http.get("${ApiUtils.baseUrl}/store/${lC.userId.value}");
  print(response.statusCode);
  if(response.statusCode==200){
     sellerController.storeModel.value =  StoreModel.fromJson(jsonDecode(response.body));
  }else{
    return mySnackBar(title: "Error", message: "Something went wrong");
  }
}