import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:picknpay/constant/api_utils.dart';
import 'package:picknpay/controller/login_controller.dart';
import 'package:picknpay/models/seller_model.dart';
import 'package:picknpay/models/user_model.dart';
import 'package:picknpay/screens/buyer/landing_page.dart';
import 'package:picknpay/screens/login_page/dialogs/login_failed_dialog.dart';
import 'package:picknpay/screens/seller/seller_landing_page.dart';
import 'package:picknpay/widgets/my_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future loginService({String phoneNumber, String password, bool buyer}) async {
  LoginController lC = Get.put(LoginController());
  lC.loading.value = true;
  SharedPreferences pref = await SharedPreferences.getInstance();
  var response = await http.get(
      "${ApiUtils.baseUrl}/${buyer ? "buyers" : "sellers"}?admin=9054f7aa9305e012b3c2300408c3dfdf390fcddf&phone=${phoneNumber.trim()}&password=${password.trim()}");

  var decodedResponse = jsonDecode(response.body);
  print(response.body);



  try {
    if (response.statusCode == 200) {
      if(buyer){
        lC.userModel.value = UserModel.fromJson(decodedResponse);
      }else{
        lC.sellerModel.value = SellerModel.fromJson(decodedResponse);
      }
      pref.setBool("userLogged", true);
      if (buyer) {
        pref.setBool("buyer", true);
        lC.buyer.value = true;
        Get.offAll(LandingPage());
      } else {
        pref.setBool("buyer", false);
        lC.buyer.value = false;
        Get.offAll(SellerLandingPage());
      }
      pref.setInt("userId",buyer?lC.userModel.value.buyer.id:lC.sellerModel.value.seller.id);
      lC.userId.value = buyer?lC.userModel.value.buyer.id:lC.sellerModel.value.seller.id;
      print(lC.userModel.value.buyer.id);
      return decodedResponse;
    } else if (response.statusCode == 404) {
      loginFailedDialog();
    } else {
      lC.loading.value = false;
      mySnackBar(title: "Error", message: decodedResponse["message"]);
      return decodedResponse;
    }
  } catch (e) {
    lC.loading.value = false;
    return e.toString();
  } finally {
    lC.loading.value = false;
  }
}
