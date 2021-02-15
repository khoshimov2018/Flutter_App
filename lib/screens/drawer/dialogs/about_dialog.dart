import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/size_boxes.dart';

aboutDialog() {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("About".tr),
            v40(),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child:
                  Text("About content will be\nadded after legal discussion "),
            )),
            v40(),
            Row(
              children: [
                Expanded(
                  child: whiteDialogButton(
                      title: "Confirm".tr, onTap: () => Get.back()),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
