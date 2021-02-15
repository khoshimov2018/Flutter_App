import 'package:flutter/material.dart';

BoxDecoration whiteConDec = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      offset: Offset(0, 6),
      blurRadius: 10,
    ),
  ],
);
