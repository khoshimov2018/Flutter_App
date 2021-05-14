import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/login_controller.dart';
import 'package:picknpay/screens/buyer/landing_page.dart';
import 'package:picknpay/screens/home_page.dart';
import 'package:picknpay/screens/seller/seller_landing_page.dart';
import 'package:picknpay/widgets/logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginController lC = Get.put(LoginController());
  @override
  void initState() {
    Timer(Duration(seconds: 2), navigation);
    // TODO: implement initState
    super.initState();
  }

  navigation() {
    if (lC.userLogged.value) {
      if (lC.buyer.value) {
        Get.off(LandingPage());
      } else {
        Get.off(SellerLandingPage());
      }
    } else {
      Get.off(HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                  alignment: Alignment.bottomCenter,
                  child: Lottie.asset("assets/svg/loading.json")),
              Center(
                child: logo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
