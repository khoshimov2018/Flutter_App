import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/screens/seller/register_item.dart';
import 'package:picknpay/widgets/buttons/black_button.dart';

class StockReceipt extends StatefulWidget {
  @override
  _StockReceiptState createState() => _StockReceiptState();
}

class _StockReceiptState extends State<StockReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: KColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          v20(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Cancel".tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer(),
                Text(
                  "Stock Receipt".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Spacer(
                  flex: 2,
                )
              ],
            ),
          ),
          Spacer(),
          blackButton(
              title: "QR Receipt".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                Get.to(RegisterItem());
              }),
          v30(),
          blackButton(
              title: "Individual warehousing".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {}),
          Spacer(),
        ],
      ),
    );
  }
}
