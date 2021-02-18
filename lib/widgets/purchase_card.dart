import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget purchaseCard(
    {String title, String price, String imageUrl, Function onDelete}) {
  return ZoomIn(
    duration: Duration(milliseconds: 300),
    child: Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, 3),
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElasticInLeft(
            child: Container(
              height: Get.height / 10,
              width: Get.height / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          ElasticInUp(child: Text(title)),
          Spacer(),
          Container(
            height: Get.height / 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElasticInRight(child: Text(price)),
                ElasticInRight(
                  child: InkWell(
                    onTap: onDelete,
                    child: Text(
                      "Remove".tr,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
