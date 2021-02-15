import 'package:picknpay/screens/drawer/kDrawer.dart';
import 'package:picknpay/screens/login_page/login_page.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/buyer/camera_feed.dart';

import 'package:picknpay/widgets/logo.dart';

import 'package:animate_do/animate_do.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
                    Get.to(LoginPage());
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ZoomIn(
                      child: Text(
                        "back".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          // shadows: [
                          //   Shadow(
                          //     color: Colors.black.withOpacity(0.3),
                          //     offset: Offset(2, 2),
                          //     blurRadius: 2,
                          //   ),
                          //   Shadow(
                          //     color: Colors.white.withOpacity(0.3),
                          //     offset: Offset(-2, -2),
                          //     blurRadius: 2,
                          //   )
                          // ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                  child: ZoomIn(
                    child: Icon(Icons.settings),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          logo(),
          Spacer(),
          Container(
            height: Get.height / 3,
            width: Get.height / 3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/svg/pick.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.to(CameraFeed());
                },
                splashColor: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(300),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ZoomIn(
            child: Text(
              "Push the button\nPlease scan the store QR code".tr,
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
