import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/drawer/dialogs/about_dialog.dart';
import 'package:picknpay/screens/drawer/dialogs/delete_id_dialog.dart';
import 'package:picknpay/screens/drawer/dialogs/logout_dialog.dart';
import 'package:picknpay/screens/drawer/dialogs/notification_dialog.dart';
import 'package:picknpay/screens/drawer/dialogs/payment_manage_dialog.dart';
import 'package:picknpay/screens/drawer/dialogs/personal_info_manage.dart';
import 'package:picknpay/screens/drawer/dialogs/service_center_dialog.dart';
import 'package:picknpay/screens/drawer/purchase_record.dart';
import 'package:picknpay/screens/drawer/seller_dialog/account_manage_dialog.dart';
import 'package:picknpay/screens/drawer/seller_dialog/business_manage_dialog.dart';
import 'package:picknpay/services/localization_service.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget kDrawer() {
  GetStorage box = GetStorage();
  var _selectedLang = LocalizationService.locale;
  return Container(
    padding: EdgeInsets.only(right: 16),
    color: KColors.black,
    width: Get.width / 1.2,
    child: Column(
      children: [
        v20(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInLeft(
              child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Get.back();
                  }),
            ),
            drawerItem(title: "Management".tr, fontWeight: FontWeight.bold)
          ],
        ),
        drawerItem(
            title: box.read("buyer")
                ? "Payment management".tr
                : "Account Management".tr,
            onTap: () {
              box.read("buyer")
                  ? paymentManageDialog()
                  : accountManagementDialog();
            }),
        box.read("buyer")
            ? SizedBox()
            : drawerItem(
                title: "Business Management".tr,
                onTap: () {
                  businessManageDialog();
                }),
        drawerItem(
            title: "Personal Information management".tr,
            onTap: () {
              personalInfoManageDialog();
            }),
        drawerItem(
            title: "Notification Settings".tr,
            onTap: () {
              notificationDialog();
            }),
        box.read("buyer")
            ? drawerItem(
                title: "Purchase Record".tr,
                onTap: () {
                  Get.to(PurchaseRecord());
                })
            : SizedBox(),
        drawerItem(
            title: "Service Center".tr,
            onTap: () {
              serviceCenterDialog();
            }),
        drawerItem(
            title: "About ".tr,
            onTap: () {
              aboutDialog();
            }),
        FadeInRight(child: myPopMenu()),

        drawerItem(
            title: "Log Out".tr,
            onTap: () {
              logoutDialog();
            }),
        // DropdownButton<String>(
        //   icon: Icon(Icons.arrow_drop_down),
        //   items: LocalizationService.langs.map((String lang) {
        //     return DropdownMenuItem(value: lang, child: Text(lang));
        //   }).toList(),
        //   onChanged: (String value) {
        //     // updates dropdown selected value
        //
        //     // gets language and changes the locale
        //     LocalizationService().changeLocale(value);
        //   },
        // ),
        Spacer(),
        drawerItem(
            title: "Delete ID".tr,
            onTap: () {
              deleteIdDialog();
            })
      ],
    ),
  );
}

Widget drawerItem({title, onTap, fontWeight}) {
  return InkWell(
    onTap: onTap,
    child: FadeInRight(
      child: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: fontWeight ?? FontWeight.w600,
              color: Colors.white,
              fontSize: 18),
          textAlign: TextAlign.right,
        ),
      ),
    ),
  );
}

Widget myPopMenu() {
  return PopupMenuButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(10),
      child: Text(
        "Change Language".tr,
        style: TextStyle(
            fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),
      ),
    ),
    color: KColors.black,
    onSelected: (value) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      LocalizationService().changeLocale(value == 1 ? "English" : "한국어");
      pref.setString("lang", value == 1 ? "English" : "한국어");
    },
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: ZoomIn(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            height: Get.height / 15,
            padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("English"),
          ),
        ),
      ),
      PopupMenuItem(
        value: 2,
        child: ZoomIn(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            height: Get.height / 15,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("한국어"),
          ),
        ),
      ),
    ],
  );
}

// onChanged: (String value) {
// // updates dropdown selected value
// // gets language and changes the locale
// LocalizationService().changeLocale(value);
// },
