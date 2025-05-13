import 'package:flutter/material.dart';

class CustomText extends Text {
  CustomText(
    String data, {
    Key? key,
    Color color = Colors.white,
    Color decorationColor = Colors.black,
    double scale = 1.0,
    double fontSize = 10.0,
    TextAlign textAlign = TextAlign.center,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration textDecoration = TextDecoration.none,
    TextOverflow? overflow,
  }) : super(
          (data.isEmpty) ? '""' : data,
          key: key,
          textAlign: textAlign,
          textScaler: TextScaler.linear(scale),
          style: TextStyle(
              color: color,
              fontStyle: fontStyle,
              fontSize: fontSize,
              decoration: textDecoration,
              decorationColor: decorationColor,
              fontWeight: fontWeight,
              overflow: overflow),
        );
}

class CustomTextMultipleLigne extends Text {
  CustomTextMultipleLigne(super.data,
      {super.key,
      Color color = Colors.black,
      double scale = 1.0,
      double fontSize = 10.0,
      TextAlign super.textAlign = TextAlign.center,
      FontWeight fontWeight = FontWeight.normal,
      FontStyle fontStyle = FontStyle.normal,
      int super.maxLines = 3})
      : super(
            textScaler: TextScaler.linear(scale),
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: color,
                fontStyle: fontStyle,
                fontSize: fontSize,
                fontWeight: fontWeight));
}
