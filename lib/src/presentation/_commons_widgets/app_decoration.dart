import 'package:flutter/material.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';

InputDecoration appInputDecoration({
  String? hintText,
  String? labelText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  Color? fillColor,
  Color? borderColor,
  required BuildContext context,
}) {
  return InputDecoration(
    filled: true,
    fillColor: fillColor ?? Colors.white,
    hintText: hintText,
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    hintStyle: TextStyle(
      fontSize: AppSize.getSize(
        context: context,
        mobileValue: 12,
        tabletValue: 15,
      ),
    ),
    labelStyle: TextStyle(
      fontSize: AppSize.getSize(
        context: context,
        mobileValue: 12,
        tabletValue: 15,
      ),
    ),

    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: borderColor ?? Colors.grey.shade300,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor ?? Colors.grey.shade300,
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor ?? Colors.grey.shade300,
        width: 1.0,
      ),
    ),
  );
}
