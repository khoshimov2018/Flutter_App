import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/API/logout_service.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/home_page.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/my_snackbar.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:shared_preferences/shared_preferences.dart';

logoutDialog() {
  GetStorage box = GetStorage();
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            v10(),
            Text(
              "Would you like to log out?".tr,
              style: plainWhite,
            ),
            v10(),
            Row(
              children: [
                Expanded(
                  child: whiteDialogButton(
                      title: "Yes".tr,
                      onTap: () async {
                       if(box.read("buyer")){
                         logoutService(buyer: true,logout: true).then((value) async{
                           if(value){
                             SharedPreferences pref =
                             await SharedPreferences.getInstance();
                             pref.setBool("userLogged", false);
                             Get.offAll(HomePage());
                           }else{
                             mySnackBar(title: "Error",message: "Something went wrong");
                           }
                         });
                       }
                       else{
                         logoutService(buyer: false,logout: true).then((value) async{
                           if(value){
                             SharedPreferences pref =
                             await SharedPreferences.getInstance();
                             pref.setBool("userLogged", false);
                             Get.offAll(HomePage());
                           }else{
                             mySnackBar(title: "Error",message: "Something went wrong");
                           }
                         });
                       }

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
