import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';

notificationDialog() {
  TextEditingController currentPassController = TextEditingController();
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("Notification".tr),
            v10(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Show Previews".tr, style: plainWhite),
                CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: KColors.primaryColor,
                  trackColor: Colors.white,
                )
              ],
            ),
            v40(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("In-app Notifications".tr, style: plainWhite),
                CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                  activeColor: KColors.primaryColor,
                  trackColor: Colors.white,
                )
              ],
            ),
            v40(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "In-app Vibration".tr,
                  style: plainWhite,
                ),
                CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                  activeColor: KColors.primaryColor,
                  trackColor: Colors.white,
                )
              ],
            ),
            v10(),
            Row(
              children: [
                Expanded(
                  child: whiteDialogButton(
                      title: "Confirm".tr,
                      onTap: () {
                        Get.back();
                      }),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: whiteDialogButton(
                      title: "Cancel".tr, onTap: () => Get.back()),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
