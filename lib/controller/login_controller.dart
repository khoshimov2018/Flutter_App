import 'package:get/get.dart';
import 'package:picknpay/models/seller_model.dart';
import 'package:picknpay/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  RxBool userLogged = false.obs;
  RxBool buyer = false.obs;
  RxBool loading = false.obs;
  RxInt userId = 0.obs;
  Rx<UserModel> userModel = UserModel().obs;
  Rx<SellerModel> sellerModel = SellerModel().obs;

  getPrefs() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool("userLogged") != null) {
      userLogged.value = pref.getBool("userLogged");
      userId.value = pref.getInt("userId");
    }
    if (pref.getBool("buyer") != null) {
      buyer.value = pref.getBool("buyer");
    }
  }

  @override
  void onInit() {
    getPrefs();
    // TODO: implement onInit
    super.onInit();
  }
}
