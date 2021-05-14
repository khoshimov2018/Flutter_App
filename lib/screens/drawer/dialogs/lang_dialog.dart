import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/API/logout_service.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/home_controller.dart';
import 'package:picknpay/services/localization_service.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

langDialog() {
  GetStorage box = GetStorage();

  HomeController hC = Get.put(HomeController());
  var num;
  return Get.dialog(
    Padding(
      padding: EdgeInsets.all(10),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: KColors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Select number of Deletions".tr,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.white,
              height: Get.height / 4,
              child: CupertinoPicker(
                onSelectedItemChanged: (int value) async {
                  num = value;
                },
                itemExtent: 50,
                children: [
                  Center(child: Text("English")),
                  Center(child: Text("한국어")),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                      title: "Change".tr,
                      onTap: () async {
                        hC.lang.value = num == 0 || num == null ? "English" : "한국어";
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        if(box.read("buyer")){
                          logoutService(buyer: true,logout: false);
                        }else{
                          logoutService(buyer: false,logout: false);
                        }


                        LocalizationService().changeLocale(
                            num == 0 || num == null ? "English" : "한국어");
                        pref.setString("lang",
                            num == 0 || num == null ? "English" : "한국어");
                        Get.back();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: whiteDialogButton(
                        title: "Cancel".tr, onTap: () => Get.back()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
