import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/home_page.dart';
import 'package:picknpay/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () => Get.off(HomePage()));
    // TODO: implement initState
    super.initState();
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
