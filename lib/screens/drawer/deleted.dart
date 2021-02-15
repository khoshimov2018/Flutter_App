import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/screens/home_page.dart';

class Deleted extends StatefulWidget {
  @override
  _DeletedState createState() => _DeletedState();
}

class _DeletedState extends State<Deleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                  color: KColors.primaryColor,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pick and Pay\nID is\nDeleted".tr,
                        style: TextStyle(color: Colors.white, fontSize: 28),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ))),
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
                    onTap: () => Get.off(HomePage()),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      height: Get.height / 15,
                      decoration: BoxDecoration(
                        color: KColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Confirm".tr,
                        style: plainWhite,
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
