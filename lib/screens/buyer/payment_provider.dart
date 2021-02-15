import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/buyer/payment_complete.dart';
import 'package:picknpay/style/text_styles.dart';

class PaymentProvider extends StatefulWidget {
  @override
  _PaymentProviderState createState() => _PaymentProviderState();
}

class _PaymentProviderState extends State<PaymentProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
                "This page will change\nDepending on the\nPayment system provider"),
          )),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  vertical: Get.height / 20, horizontal: 16),
              decoration: BoxDecoration(
                color: KColors.black,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Get.to(PaymentComplete()),
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
                            "Payment".tr,
                            style: plainWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
