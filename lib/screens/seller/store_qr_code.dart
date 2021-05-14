import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/home_page.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/buttons/black_button.dart';
import 'package:picknpay/widgets/size_boxes.dart';

class StoreQRCode extends StatefulWidget {
  @override
  _StoreQRCodeState createState() => _StoreQRCodeState();
}

class _StoreQRCodeState extends State<StoreQRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: KColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          v15(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Text(
                    "Cancel".tr,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                Spacer(),
                Text(
                  "Store QR code".tr,
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
          v10(),
          Text(
            "Print the QR code and\nplace it in front of the store".tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          v15(),
          SvgPicture.asset("assets/svg/qrCode.svg"),
          Spacer(),
          blackButton(
            title: "Save".tr,
            onTap: () {},
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: Get.height / 20),
            decoration: BoxDecoration(
              color: KColors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  offset: Offset(0, -3),
                  blurRadius: 6,
                )
              ],
            ),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                alignment: Alignment.center,
                height: Get.height / 15,
                width: Get.width / 1.4,
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
          )
        ],
      ),
    );
  }
}
