import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picknpay/API/seller/get_store_service.dart';
import 'package:picknpay/API/seller/post_store_service.dart';
import 'package:picknpay/widgets/my_snackbar.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';

import 'package:picknpay/screens/drawer/dialogs/default_dialog.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';

addBusinessDialog() {
  TextEditingController bankAcController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController businessRegController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();

  return Get.dialog(
    Dialog(
      // insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              dialogTitle("Add Store".tr),
              v40(),
              Text(
                "Enter Business and bank account.".tr,
                style: plainWhite,
                textAlign: TextAlign.center,
              ),
              v40(),
              kTextField(
                  keyBoardType: TextInputType.number,
                  hintText: "Business Registration Number".tr,
                  controller: businessRegController),
              v60(),
              kTextField(
                  hintText: "Store Name".tr,
                  controller: storeNameController),
              v60(),
              kTextField(
                  hintText: "Bank Name".tr, controller: bankNameController),
              v60(),
              kTextField(
                  keyBoardType: TextInputType.number,
                  hintText: "Bank Account Number".tr,
                  controller: bankAcController),
              v40(),
              Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                        title: "Add".tr,
                        onTap: () {
                          bankNameController.text.trim();
                          bankAcController.text.trim();
                          businessRegController.text.trim();
                          storeNameController.text.trim();
                         if(bankNameController.text.isNotEmpty&&bankAcController.text.isNotEmpty&&storeNameController.text.isNotEmpty&&businessRegController.text.isNotEmpty){
                           Get.back();
                           postStoreService(businessRegController.text, storeNameController.text, bankNameController.text, bankAcController.text).then((value) {
                             if(value){
                               defaultDialog(
                                   header: "Store Added".tr,
                                   title: "${storeNameController.text} has been\nadded to your account."
                                       .tr);
                               getStoreService();
                             }else{
                               defaultDialog(
                                   title:
                                   "Business certification failed\nplease try again"
                                       .tr,
                                   header: "Add Business".tr);
                             }
                           });
                         }else{
                          mySnackBar(title: "Required",message: "All values are required");
                         }

                        }),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: whiteDialogButton(
                        title: "Cancel".tr,
                        onTap: () {
                        Get.back();
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
