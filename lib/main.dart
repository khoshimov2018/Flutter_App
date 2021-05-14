import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/controller/home_controller.dart';
import 'package:picknpay/screens/splash_screen.dart';
import 'package:picknpay/services/localization_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getLang().then((value) => runApp(MyApp()));
}

Future getLang() async {
  HomeController hC = Get.put(HomeController());
  SharedPreferences pref = await SharedPreferences.getInstance();
  if (pref.getString("lang") != null) {
    hC.lang.value = pref.getString("lang").toString();
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  HomeController hC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GetMaterialApp(
          defaultTransition: Transition.fade,
          debugShowCheckedModeBanner: false,
          title: 'Pick n Pay',
          locale: hC.lang.value == "English"
              ? Locale('en', 'US')
              : hC.lang.value == "한국어"
                  ? Locale('ko', 'KR')
                  : Locale('en', 'US'), //default lang
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          home: SplashScreen(),
        );
      },
    );
  }
}
