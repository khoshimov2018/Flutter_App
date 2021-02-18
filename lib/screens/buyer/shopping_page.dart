import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/camera_controller.dart';
import 'package:picknpay/style/box_decorations.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/on_delete_dialog.dart';
import 'package:picknpay/widgets/purchase_card.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/screens/buyer/check_cart.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List items = [];
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
          }
        }
      }
    });
  }

  ScrollController scrollController = ScrollController();
  CameraController cc = CameraController();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text(
                      "Go Back".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          v40(),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: whiteConDec,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: () {},
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
                                    opacity: 0.4,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Lottie.asset(
                                          "assets/svg/barcodeScan.json"),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    qrViewController.toggleFlash();
                                    qrViewController.getFlashStatus().then(
                                        (value) => cc.flash.value = value);
                                  },
                                  child: Obx(() {
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
                                  }),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      alignment: Alignment.center,
                      child: items.length > 0
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              controller: scrollController,
                              padding: EdgeInsets.all(7),
                              itemBuilder: (BuildContext context, int index) {
                                return purchaseCard(
                                  title: "Perfume",
                                  imageUrl:
                                      "https://lh3.googleusercontent.com/proxy/udEqYER0GUxTySSTS56TB1zUfv4xsxzB5ZPL3ZkzTCyvIGvoIZW3uWvxMc3vfnJYooHowkqqVLslqmEtlgqEByyJ6V_ZS2xLGba4JzT0w8uMhPNQ3d5OF0sg60mCYOE9MHWnldczs5U",
                                  price: "₩1000",
                                  onDelete: () {
                                    onDeleteDialog();
                                  },
                                );
                              },
                              itemCount: items.length,
                            )
                          : Text("Scan item barcode".tr),
                    ),
                  ),
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
                            Get.to(CheckCart());
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
                              "Pay".tr,
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
                    Text(
                      "Total:".tr,
                      style: plainWhite,
                    ),
                    Text(
                      "₩${items.length * 1000}",
                      style: plainWhite,
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
