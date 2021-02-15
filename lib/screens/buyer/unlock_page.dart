import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/buyer/shopping_page.dart';
import 'package:picknpay/style/text_styles.dart';

class UnlockPage extends StatefulWidget {
  @override
  _UnlockPageState createState() => _UnlockPageState();
}

class _UnlockPageState extends State<UnlockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryColor,
      body: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          ZoomIn(child: SvgPicture.asset("assets/svg/lock.svg")),
          Spacer(),
          Text(
            "Put your phone on the door lock\nUnlock it".tr,
            style: plainWhite,
            textAlign: TextAlign.center,
          ),
          Spacer(),
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
                      onTap: () => Get.to(ShoppingPage()),
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
                            "Next".tr,
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
