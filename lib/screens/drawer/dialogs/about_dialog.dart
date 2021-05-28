import 'package:flutter/material.dart';
import 'package:get/get.dart';

aboutDialog() {
  return Get.dialog(Dialog(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)), //this right here
    child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Text(
                    'About',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                  flex: 9,
                  child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            "대표: 서희원\n"
                            "사업자등록번호: 319-42-00812\n"
                            "전화번호: 02-400-9197\n"
                            "Email: picknpayaccd@gmail.com\n"
                            "주소: 서울특별시 송파구 마천로 72 \n"
                            "(05659)\n"
                            "\n"
                            "Copyright © Pick n Pay.\n"
                            "All rights reserved.",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ))),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    // height: 60,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () => Get.back(),
                      color: Colors.white,
                      child: Text(
                        "확인",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  )),
            ],
          ),
        )),
  ));
}
