import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/camera_controller.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/seller_product_card.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/screens/seller/new_stock_list.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class RegisterItem extends StatefulWidget {
  @override
  _RegisterItemState createState() => _RegisterItemState();
}

class _RegisterItemState extends State<RegisterItem> {
  GetStorage box = GetStorage();
  List items = [];
  List wrong = [];
  bool error = false;
  QRViewController qrViewController;

  void _onQRViewCreated(QRViewController controller) {
    this.qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData != null) {
        if (items.contains(scanData.code)) {
        } else {
          if (scanData.format != BarcodeFormat.qrcode) {
            FlutterBeep.beep();
            setState(() {
              HapticFeedback.vibrate();
              scrollController.animateTo(
                  scrollController.position.maxScrollExtent + Get.height / 9,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease);
              items.add(scanData.code);
            });
          } else {
            if (wrong.contains(scanData.code)) {
            } else {
              FlutterBeep.beep(false);
              setState(() {
                error = true;
                wrong.add(scanData.code);
              });
              errorDown();
            }
          }
        }
      }
    });
  }

  void errorDown() async {
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      error = false;
    });
  }

  ScrollController scrollController = ScrollController();
  CameraController cc = CameraController();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;

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
                  onTap: () => Get.back(),
                  child: Text(
                    "Cancel".tr,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                Spacer(),
                Text(
                  box.read("newStock") ? "Register Item".tr : "Restocking".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Spacer(
                  flex: 2,
                )
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
                  ]),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(left: 7, right: 7, top: 7),
                      child: AspectRatio(
                        aspectRatio: 4 / 3.5,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: QRView(
                                key: qrKey,
                                onQRViewCreated: _onQRViewCreated,
                              ),
                            ),
                            ZoomIn(
                              child: Center(
                                child: Opacity(
                                  opacity: error ? 1 : 0.4,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: error ? 0 : 16,
                                    ),
                                    child: Lottie.asset(error
                                        ? "assets/svg/wrong.json"
                                        : "assets/svg/barcodeScan.json"),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  qrViewController.toggleFlash();
                                  qrViewController
                                      .getFlashStatus()
                                      .then((value) => cc.flash.value = value);
                                },
                                child: Obx(
                                  () {
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: cc.flash.value
                                            ? KColors.primaryColor
                                            : KColors.black,
                                        shape: BoxShape.circle,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.flare_sharp,
                                        color: cc.flash.value
                                            ? Colors.white
                                            : KColors.primaryColor,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              alignment: Alignment.center,
                              child: ListView.builder(
                                controller: scrollController,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(7),
                                itemBuilder: (BuildContext context, int index) {
                                  return sellerProductCard(
                                    price: "₩15,000",
                                    imageUrl:
                                        "https://www.incimages.com/uploaded_files/image/1920x1080/*Barcode_32896.jpg",
                                    title: "082830100012 / Ice Cream",
                                    pcs: "20",
                                  );
                                },
                                itemCount: items.length,
                              )),
                          items.length == 0
                              ? Center(child: Text("Scan the store QR code"))
                              : SizedBox()
                        ],
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
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
                        onTap: () {
                          if (items.length > 0) {
                            qrViewController.getFlashStatus().then((value) {
                              if (value) {
                                qrViewController.toggleFlash();
                                cc.flash.value = false;
                              }
                            });
                            Get.to(NewStockList());
                          }
                        },
                        child: ZoomIn(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            alignment: Alignment.center,
                            height: Get.height / 15,
                            decoration: BoxDecoration(
                              color: items.length > 0
                                  ? KColors.primaryColor
                                  : KColors.disColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Register".tr,
                              style: plainWhite,
                            ),
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
                    FadeInLeft(
                      child: Text(
                        "Number of products:".tr,
                        style: plainWhite,
                      ),
                    ),
                    FadeInRight(
                      child: Text(
                        "${items.length} ${"Pcs".tr}",
                        style: plainWhite,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
