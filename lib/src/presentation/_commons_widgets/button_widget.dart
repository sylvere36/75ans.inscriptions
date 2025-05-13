import 'package:flutter/material.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/loading_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final Widget? widget;
  final Function? onpressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final bool? fontWeightNormal;
  final double? width;
  final double? height;
  final double? elevation;
  final Widget? icon;
  final bool? loading;
  const ButtonWidget({
    super.key,
    this.title,
    this.widget,
    required this.onpressed,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.fontWeightNormal,
    this.height,
    this.elevation,
    this.icon,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    double buttonHeight =
        height != null
            ? height!
            : AppSize.getSize(
              context: context,
              mobileValue: 50,
              tabletValue: 50,
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
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color:
                onpressed == null || loading == true
                    ? Colors.grey
                    : backgroundColor ?? AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            border:
                borderColor == null ? null : Border.all(color: borderColor!),
          ),
          child:
              loading == true
                  ? const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: LoadingWidget(
                      color: Colors.white,
                      height: 15,
                      width: 15,
                    ),
                  )
                  : Builder(
                    builder:
                        (context) => ElevatedButton(
                          onPressed:
                              onpressed == null ? null : () => onpressed!(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                onpressed == null || loading == true
                                    ? Colors.grey
                                    : backgroundColor ?? AppColors.primary,
                            elevation: elevation,
                            disabledForegroundColor: Colors.grey.withValues(
                              alpha: 0.38,
                            ),
                            disabledBackgroundColor: Colors.grey.withValues(
                              alpha: 0.12,
                            ),
                            padding: const EdgeInsets.all(10.0),
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
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                        ),
                                        child: Text(
                                          title!.toUpperCase(),
                                          style: TextStyle(
                                            color:
                                                onpressed == null
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
                                              mobileValue: 14.0,
                                              tabletValue: 14,
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
                                        tabletValue: 17,
                                        smallerThanMobileValue: 9,
                                      ),
                                    ),
                                  )),
                        ),
                  ),
        );
  }
}

class ButtonWidgetTextButton extends StatelessWidget {
  final String? title;
  final Widget? widget;
  final Function onpressed;
  final Color? borderColor;
  final Color? textColor;
  const ButtonWidgetTextButton({
    super.key,
    this.title,
    this.widget,
    required this.onpressed,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: AppSize.getSize(
        context: context,
        mobileValue: 50.0,
        smallerThanMobileValue: 40,
      ),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: borderColor ?? AppColors.primary),
      ),
      child: Builder(
        builder:
            (context) => TextButton(
              onPressed: () => onpressed(),
              style: TextButton.styleFrom(
                foregroundColor: textColor ?? AppColors.primary,
                padding: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              child:
                  widget ??
                  Text(
                    title!.toUpperCase(),
                    style: TextStyle(
                      color: textColor ?? AppColors.primary,
                      fontSize: AppSize.getSize(
                        context: context,
                        mobileValue: 15.0,
                        smallerThanMobileValue: 9,
                      ),
                    ),
                  ),
            ),
      ),
    );
  }
}

class ButtonWidgetOutlinedButton extends StatelessWidget {
  final String? title;
  final Widget? widget;
  final Function? onpressed;
  final Color? borderColor;
  final Color? textColor;
  final Widget? icon;
  const ButtonWidgetOutlinedButton({
    super.key,
    this.title,
    this.widget,
    required this.onpressed,
    this.borderColor,
    this.icon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: AppSize.getSize(
        context: context,
        mobileValue: 50.0,
        smallerThanMobileValue: 40,
      ),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor ?? AppColors.primary),
      ),
      child: Builder(
        builder:
            (context) => OutlinedButton(
              onPressed: onpressed == null ? null : () => onpressed!(),
              style: OutlinedButton.styleFrom(
                foregroundColor: borderColor ?? AppColors.primary,
                padding: const EdgeInsets.all(10.0),
                side: BorderSide(color: borderColor ?? AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child:
                  widget ??
                  (icon != null
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          icon!,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Text(
                              title!.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textColor ?? AppColors.primary,
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
                        title!.toUpperCase(),
                        style: TextStyle(
                          color: textColor ?? AppColors.primary,
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

class RightButton extends StatelessWidget {
  final String title;
  final Function? onpressed;
  final bool? loading;
  final double width;
  const RightButton({
    super.key,
    required this.title,
    required this.onpressed,
    this.loading,
    this.width = 170,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.sizeOf(context).width - width,
        right: AppSize.getSize(context: context, mobileValue: 20),
        top: AppSize.getSize(context: context, mobileValue: 10),
        bottom: AppSize.getSize(context: context, mobileValue: 20),
      ),
      child: SizedBox(
        height: AppSize.getSize(context: context, mobileValue: 50),
        child: ButtonWidget(
          onpressed: onpressed,
          title: title,
          loading: loading,
        ),
      ),
    );
  }
}
