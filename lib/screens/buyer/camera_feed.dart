import 'package:flutter_beep/flutter_beep.dart';
import 'package:picknpay/style/box_decorations.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/camera_controller.dart';
import 'package:picknpay/screens/buyer/branch_display.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../main.dart';

class CameraFeed extends StatefulWidget {
  @override
  _CameraFeedState createState() => _CameraFeedState();
}

class _CameraFeedState extends State<CameraFeed> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List wrongCode = [];
  List rightCode = [];
  void _onQRViewCreated(QRViewController controller) {
    this.qrViewController = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (scanData != null && scanData.format == BarcodeFormat.qrcode) {
        if (rightCode.contains(scanData.code)) {
        } else {
          setState(() {
            rightCode.add(scanData.code);
            success = true;
          });
          FlutterBeep.beep(true);
          await Future.delayed(Duration(milliseconds: 1300));
          HapticFeedback.vibrate();
          qrViewController.getFlashStatus().then((value) {
            if (value) {
              qrViewController.toggleFlash();
              cc.flash.value = false;
            }
          });
          Get.to(BranchDisplay());
          setState(() {
            success = false;
          });
        }
      } else {
        if (wrongCode.contains(scanData.code)) {
        } else {
          FlutterBeep.beep(false);
          wrongCode.add(scanData.code);
          setState(() {
            wrong = true;
          });
          Get.snackbar(
              "Please Scan Only QR Code", "Scan Valid QR Code of Store",
              backgroundColor: KColors.black,
              colorText: KColors.primaryColor,
              snackPosition: SnackPosition.BOTTOM,
              boxShadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, -4),
                  blurRadius: 15,
                )
              ],
              margin: EdgeInsets.all(0),
              snackStyle: SnackStyle.FLOATING,
              shouldIconPulse: true,
              borderRadius: 0,
              icon: Icon(
                Icons.qr_code,
                color: KColors.primaryColor,
                size: 40,
              ),
              isDismissible: true);
          await Future.delayed(Duration(milliseconds: 2100));
          setState(() {
            wrong = false;
          });
        }
      }
    });
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController qrViewController;
  CameraController cc = CameraController();
  bool success = false;
  bool wrong = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Cancel".tr,
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
                      flex: 2,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(7),
                          child: AspectRatio(
                              aspectRatio: 4 / 4.1,
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
                                        opacity: 0.3,
                                        child: Lottie.asset(
                                            "assets/svg/scan2.json"),
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
                              )),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: success
                          ? Lottie.asset("assets/svg/success.json")
                          : wrong
                              ? Lottie.asset("assets/svg/wrong.json")
                              : Text("Scan the store QR code".tr),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 8,
          ),
        ],
      ),
    );
  }
}
