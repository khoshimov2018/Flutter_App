import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/drawer/kDrawer.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/screens/login_page/login_page.dart';
import 'package:picknpay/screens/seller/business_home_page.dart';
import 'package:picknpay/widgets/buttons/black_button.dart';
import 'package:picknpay/widgets/logo.dart';

class SellerLandingPage extends StatefulWidget {
  @override
  _SellerLandingPageState createState() => _SellerLandingPageState();
}

class _SellerLandingPageState extends State<SellerLandingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: kDrawer(),
      key: _scaffoldKey,
      backgroundColor: KColors.primaryColor,
      body: Column(
        children: [
          v15(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.off(LoginPage());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "back".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                    child: Icon(
                      Icons.settings,
                      color: KColors.black,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          logo(),
          Hero(
            tag: "seller",
            child: Material(
              color: Colors.transparent,
              child: Text(
                "SELLER".tr,
                style: TextStyle(color: Colors.white, fontSize: 40, shadows: [
                  Shadow(color: Colors.black, offset: Offset(4, 4))
                ]),
              ),
            ),
          ),
          v20(),
          Text(
            "Please select a business site to manage".tr,
            style: plainWhite,
          ),
          v20(),
          blackButton(
              title: "Pick and Go".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                Get.offAll(BusinessHomePage());
              }),
        ],
      ),
    );
  }
}
