import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/seller/business_home_page.dart';
import 'package:picknpay/screens/seller/dialogs/edit_item_dialogs.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/on_delete_dialog.dart';
import 'package:picknpay/widgets/seller_product_card.dart';
import 'package:picknpay/widgets/size_boxes.dart';

class ManageStock extends StatefulWidget {
  @override
  _ManageStockState createState() => _ManageStockState();
}

class _ManageStockState extends State<ManageStock> {
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
                      "Manage Stock".tr,
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
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    alignment: Alignment.center,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(
                          bottom: Get.height / 4, left: 7, right: 7, top: 7),
                      itemBuilder: (BuildContext context, int index) {
                        return sellerProductCard(
                          price: "₩15,000",
                          imageUrl:
                              "https://www.incimages.com/uploaded_files/image/1920x1080/*Barcode_32896.jpg",
                          title: "082830100012 / Ice Cream",
                          pcs: "20",
                        );
                      },
                      itemCount: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: Get.height / 6,
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
                                onTap: () => Get.to(BusinessHomePage()),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  alignment: Alignment.center,
                                  height: Get.height / 15,
                                  decoration: BoxDecoration(
                                    color: KColors.primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "Complete".tr,
                                    style: plainWhite,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Number of products:".tr,
                              style: plainWhite,
                            ),
                            Text(
                              "4 ${"Pcs".tr}",
                              style: plainWhite,
                            )
                          ],
                        ),
                      )
                    ],
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
        value == 2 ? editItemDialog() : onDeleteDialog();
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
