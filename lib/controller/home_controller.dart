import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxString lang = "".obs;
  @override
  void onInit() {
    getLang();
    // TODO: implement onInit
    super.onInit();
  }

  void getLang() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("lang") != null) {
      lang = pref.getString("lang").toString().obs;
    }
  }
}
