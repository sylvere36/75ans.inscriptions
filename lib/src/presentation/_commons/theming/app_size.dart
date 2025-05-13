import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppSize {
  static getSize({
    required BuildContext context,
    double defaultValue = 60.0,
    double? mobileValue,
    double? tabletValue,
    double? smallerThanMobileValue = 10.0,
    double? largerThanTabbletValue = 80.0,
  }) {
    tabletValue = tabletValue ?? (mobileValue != null ? mobileValue + 8 : null);
    largerThanTabbletValue = tabletValue;
    smallerThanMobileValue = (mobileValue != null ? mobileValue - 8 : null);
    return ResponsiveValue(
      context,
      defaultValue: defaultValue,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: mobileValue),
        Condition.equals(name: TABLET, value: tabletValue),
        Condition.smallerThan(name: MOBILE, value: smallerThanMobileValue),
        Condition.largerThan(name: TABLET, value: largerThanTabbletValue),
      ],
    ).value;
  }

  static bool isTablet(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isTablet;
  }

  static bool isMobile(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile;
  }
}
