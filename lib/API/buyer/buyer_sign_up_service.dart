
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:picknpay/constant/api_utils.dart';
import 'package:picknpay/controller/login_controller.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future buyerSignUpService({String phoneNumber, String password}) async {
  LoginController lC = Get.put(LoginController());
  lC.loading.value = true;
  SharedPreferences pref = await SharedPreferences.getInstance();

  String body = '{ "password":"$password",  "phone":"$phoneNumber",  "all_agreed": true,  "terms_of_service": true}';

  var response = await http.post(
      "${ApiUtils.baseUrl}/buyers",
       headers: {"Content-Type": "application/json"},
      body: body);

  if(response.statusCode == 200){
    lC.loading.value = false;
    return true;



  }else{
    lC.loading.value = false;
    return false;
  }


}
