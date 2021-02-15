import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/seller/dialogs/edit_item_dialogs.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';

class SalesManagement extends StatefulWidget {
  @override
  _SalesManagementState createState() => _SalesManagementState();
}

class _SalesManagementState extends State<SalesManagement> {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryColor,
      body: Stack(
        children: [
          Column(
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
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Sales Management".tr,
                      style: pageHeader,
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
              v40(),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, 6),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Text("Graph Generated")),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                      color: KColors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, -3),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_left),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                        Text(
                          "2021 . 01 . 18",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_right),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                      color: KColors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, -3),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Day".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Week".tr,
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Month".tr,
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Quarter".tr,
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Year".tr,
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height / 10,
                    decoration: BoxDecoration(
                      color: KColors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, -3),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: Get.width / 3,
                          height: Get.height / 18,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: KColors.primaryColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Text(
                            "By Item".tr,
                            style: plainWhite,
                          ),
                        ),
                        Container(
                          width: Get.width / 3,
                          height: Get.height / 18,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Text(
                            "By Category".tr,
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

Widget myPopMenu() {
  return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: KColors.black,
      onSelected: (value) {
        value == 2 ? editItemDialog() : null;
      },
      itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: Get.height / 15,
                padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Delete'.tr),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Container(
                margin: EdgeInsets.only(top: 16, bottom: 10),
                height: Get.height / 15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Edit'.tr),
              ),
            ),
          ]);
}
