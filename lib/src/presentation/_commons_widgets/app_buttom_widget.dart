import 'package:madeb75/gen/assets.gen.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
    this.textFontFamilly,
    this.textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });
  final void Function()? onPressed;
  final String title;
  final SvgGenImage? icon;
  final String? textFontFamilly;
  final FontWeight? textWeight;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.getSize(context: context, mobileValue: 48),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? AppColors.primary,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              side: BorderSide(color: borderColor ?? Colors.transparent),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: EdgeInsets.only(
                  right: AppSize.getSize(context: context, mobileValue: 10),
                ),
                child: icon!.svg(),
              ),
            Text(
              title,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: AppSize.getSize(context: context, mobileValue: 14),
                fontWeight: textWeight ?? FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppButtonWidget extends StatelessWidget {
  final String? title;
  final Widget? widget;
  final Function? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final bool? fontWeightNormal;
  final double? width;
  final double? height;
  final double? elevation;
  final Widget? icon;
  final bool? loading;
  final EdgeInsetsGeometry? margin;
  const AppButtonWidget({
    super.key,
    this.title,
    this.widget,
    required this.onPressed,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.fontWeightNormal,
    this.height,
    this.elevation,
    this.icon,
    this.loading,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    double buttonHeight =
        height != null
            ? height!
            : AppSize.getSize(
              context: context,
              mobileValue: 50,
              smallerThanMobileValue: 36,
            );
    return loading == true
        ? Material(
          color: Colors.grey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(
                  AppSize.getSize(context: context, mobileValue: 15.0),
                ),
                child: LoadingWidget(
                  color: Colors.white,
                  height: AppSize.getSize(context: context, mobileValue: 20.0),
                  width: AppSize.getSize(context: context, mobileValue: 20.0),
                ),
              ),
            ],
          ),
        )
        : Container(
          width: width ?? MediaQuery.of(context).size.width,
          height: buttonHeight,
          margin: EdgeInsets.only(
            top: AppSize.getSize(context: context, mobileValue: 10),
          ),
          decoration: BoxDecoration(
            color:
                onPressed == null || loading == true
                    ? Colors.grey
                    : backgroundColor ?? AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            border:
                borderColor == null ? null : Border.all(color: borderColor!),
          ),
          child:
              loading == true
                  ? Padding(
                    padding: EdgeInsets.all(
                      AppSize.getSize(context: context, mobileValue: 14),
                    ),
                    child: LoadingWidget(
                      color: Colors.white,
                      height: AppSize.getSize(
                        context: context,
                        mobileValue: 15,
                      ),
                      width: AppSize.getSize(context: context, mobileValue: 15),
                    ),
                  )
                  : Builder(
                    builder:
                        (context) => ElevatedButton(
                          onPressed:
                              onPressed == null ? null : () => onPressed!(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                onPressed == null || loading == true
                                    ? Colors.grey
                                    : backgroundColor ?? AppColors.primary,
                            elevation: elevation,
                            disabledForegroundColor: Colors.grey.withValues(
                              alpha: 0.38,
                            ),
                            disabledBackgroundColor: Colors.grey.withValues(
                              alpha: 0.12,
                            ),
                            padding: EdgeInsets.all(
                              AppSize.getSize(
                                context: context,
                                mobileValue: 10,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child:
                              widget ??
                              (icon != null
                                  ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      icon!,
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppSize.getSize(
                                            context: context,
                                            mobileValue: 20,
                                          ),
                                        ),
                                        child: Text(
                                          title!.toUpperCase(),
                                          style: TextStyle(
                                            color:
                                                onPressed == null
                                                    ? Colors.white
                                                    : textColor ??
                                                        AppColors.primary,
                                            fontWeight:
                                                fontWeightNormal != null &&
                                                        fontWeightNormal!
                                                    ? FontWeight.normal
                                                    : FontWeight.bold,
                                            fontSize: AppSize.getSize(
                                              context: context,
                                              mobileValue: 15.0,
                                              smallerThanMobileValue: 9,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  : Text(
                                    title!,
                                    style: TextStyle(
                                      color: textColor ?? Colors.white,
                                      fontWeight:
                                          fontWeightNormal != null &&
                                                  fontWeightNormal!
                                              ? FontWeight.normal
                                              : FontWeight.bold,
                                      fontSize: AppSize.getSize(
                                        context: context,
                                        mobileValue: 15.0,
                                        smallerThanMobileValue: 9,
                                      ),
                                    ),
                                  )),
                        ),
                  ),
        );
  }
}
