import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/buyer/landing_page.dart';
import 'package:picknpay/style/text_styles.dart';

class PaymentComplete extends StatefulWidget {
  @override
  _PaymentCompleteState createState() => _PaymentCompleteState();
}

class _PaymentCompleteState extends State<PaymentComplete> {
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
                      JelloIn(
                        child: Text(
                          "GO!".tr,
                          style: TextStyle(
                              fontSize: 150,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Color(0xff1F1F2B),
                                    offset: Offset(10, 10),
                                    blurRadius: 0)
                              ]),
                        ),
                      ),
                      JelloIn(
                        child: Text(
                          "Payment Complete".tr,
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
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
                    onTap: () => Get.off(LandingPage()),
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
                          "Complete".tr,
                          style: plainWhite,
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
