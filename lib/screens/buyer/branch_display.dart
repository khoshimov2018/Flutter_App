import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/buyer/unlock_page.dart';
import 'package:picknpay/style/text_styles.dart';

class BranchDisplay extends StatefulWidget {
  @override
  _BranchDisplayState createState() => _BranchDisplayState();
}

class _BranchDisplayState extends State<BranchDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryColor,
      body: Column(
        children: [
          Spacer(),
          ZoomIn(
            child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: Get.height / 15),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 6,
                  )
                ],
                color: KColors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "‘Pick and Go Bangi Branch’\nIs this correct?".tr,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            padding:
                EdgeInsets.symmetric(vertical: Get.height / 20, horizontal: 16),
            decoration: BoxDecoration(
              color: KColors.black,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Get.to(UnlockPage()),
                    child: ZoomIn(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        alignment: Alignment.center,
                        height: Get.height / 15,
                        decoration: BoxDecoration(
                          color: KColors.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Yeah".tr,
                          style: plainWhite,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: ZoomIn(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        alignment: Alignment.center,
                        height: Get.height / 15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "No".tr,
                          style: TextStyle(color: KColors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
