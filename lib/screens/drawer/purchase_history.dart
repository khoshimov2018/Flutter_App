import 'package:animate_do/animate_do.dart';
import 'package:picknpay/API/buyer/get_purchase_history.dart';
import 'package:picknpay/controller/buyer_controller.dart';
import 'package:picknpay/controller/login_controller.dart';
import 'package:picknpay/widgets/loader.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';

class PurchaseRecord extends StatefulWidget {
  @override
  _PurchaseRecordState createState() => _PurchaseRecordState();
}

class _PurchaseRecordState extends State<PurchaseRecord> {
  @override
  void initState() {
    getPurchaseHistory();
    // TODO: implement initState
    super.initState();
  }

  BuyerController bC = Get.put(BuyerController());
  LoginController lC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.arrow_back_ios_rounded)),
                ),
                Spacer(),
                Text(
                  "Purchase History".tr,
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
              padding: EdgeInsets.only(bottom: 2, top: 2),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Obx(() {
                    return Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          child: lC.loading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        KColors.primaryColor),
                                  ),
                                )
                              : ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(7),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ZoomIn(
                                      duration: Duration(milliseconds: 300),
                                      child: InkWell(
                                        onTap: () {
                                          // Get.dialog(Padding(
                                          //   padding: EdgeInsets.all(10),
                                          //   child: Dialog(
                                          //     shape: RoundedRectangleBorder(
                                          //       borderRadius: BorderRadius.circular(15),
                                          //     ),
                                          //     backgroundColor: KColors.black,
                                          //     child: Column(
                                          //       mainAxisSize: MainAxisSize.min,
                                          //       children: [
                                          //         Padding(
                                          //           padding: EdgeInsets.all(10.0),
                                          //           child: Text(
                                          //             "Select number of Deletions",
                                          //             style: TextStyle(
                                          //                 fontWeight: FontWeight.bold,
                                          //                 color: Colors.white),
                                          //           ),
                                          //         ),
                                          //         Padding(
                                          //           padding: EdgeInsets.only(bottom: 10),
                                          //           child: Text(
                                          //             "Ice Cream",
                                          //             style:
                                          //                 plainWhite,
                                          //           ),
                                          //         ),
                                          //         Container(
                                          //           color: Colors.white,
                                          //           height: Get.height / 4,
                                          //         ),
                                          //         Padding(
                                          //           padding: EdgeInsets.all(10.0),
                                          //           child: Row(
                                          //             children: [
                                          //               Expanded(
                                          //                 child: whiteDialogButton(
                                          //                     title: "Delete",
                                          //                     onTap: () {
                                          //                       Get.back();
                                          //                     }),
                                          //               ),
                                          //               SizedBox(
                                          //                 width: 16,
                                          //               ),
                                          //               Expanded(
                                          //                 child: whiteDialogButton(
                                          //                     title: "Cancel",
                                          //                     onTap: () => Get.back()),
                                          //               ),
                                          //             ],
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          margin:
                                              EdgeInsets.symmetric(vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.16),
                                                offset: Offset(0, 3),
                                                blurRadius: 2,
                                              )
                                            ],
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: Get.height / 10,
                                                width: Get.height / 10,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQnb-jEL3vq1x3oFC0rNECkjqXfQbqnm7Lw&usqp=CAU"),
                                                        fit: BoxFit.cover)),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(bC.userPurchasedItem[index]
                                                  ["name"]),
                                              Spacer(),
                                              Container(
                                                height: Get.height / 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "₩${bC.userPurchasedItem[index]["price"]}"),
                                                    Text(
                                                        "${bC.userPurchasedItem[index]["purchasedAt"]}"),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: bC.userPurchasedItem.length,
                                ),
                        ));
                  })
                ],
              ),
            ),
          ),
          v30(),
        ],
      ),
    );
  }
}
