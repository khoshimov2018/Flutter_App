import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

Widget dialogTitle(String title) {
  return ZoomIn(
    child: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
