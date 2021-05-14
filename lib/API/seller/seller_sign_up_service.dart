import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:picknpay/constant/api_utils.dart';
import 'package:picknpay/controller/login_controller.dart';
import 'package:picknpay/controller/seller_sign_up_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> sellerSignUpService() async {
  LoginController lC = Get.put(LoginController());
  SellerSignUPController sC = Get.put(SellerSignUPController());
  lC.loading.value = true;
  SharedPreferences pref = await SharedPreferences.getInstance();

  String body = '{"password":"${sC.password.value}",  "phone":"${sC.phoneNumber.value}",  "business_name":"${sC.businessName.value}", "account_number":"${sC.acNum.value}", "bank":"${sC.bankName.value}", "QRCODE":"258258258", "registration_number":"${sC.companyRegNum.value}", "all_agreed": true,  "terms_of_service": true}';

  var response = await http.post(
      "${ApiUtils.baseUrl}/sellers",
      headers: {"Content-Type": "application/json"},
      body: body);

  print(response.statusCode);
  print(response.body);

  if(response.statusCode == 200){
    lC.loading.value = false;
    return true;
  }else{
    lC.loading.value = false;
    return false;
  }
}
