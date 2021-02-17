import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/buyer/shopping_page.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';

class RegisterNFC extends StatefulWidget {
  @override
  _RegisterNFCState createState() => _RegisterNFCState();
}

class _RegisterNFCState extends State<RegisterNFC> {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Scaffold(
      backgroundColor: KColors.primaryColor,
      body: Column(
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
                  box.read("register") ? "Register NFC".tr : "Change NFC".tr,
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
          Spacer(
            flex: 2,
          ),
          ZoomIn(child: SvgPicture.asset("assets/svg/lock.svg")),
          Spacer(),
          Text(
            box.read("register")
                ? "Place your phone next to the NFC lock\nRegister the code".tr
                : "Place your phone next to the NFC lock\nChange the code".tr,
            style: plainWhite,
            textAlign: TextAlign.center,
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
                    onTap: () => Get.back(),
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
                          "Confirm".tr,
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
