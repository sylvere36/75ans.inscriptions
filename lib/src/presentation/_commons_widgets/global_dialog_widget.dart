import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/custom_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

customShowDialog({
  required BuildContext context,
  String? title,
  String? description,
  Widget? content,
  String? yesText,
  String? noText,
  required Function? onTap,
  bool? hideAction,
  double? height,
  Function? noOnTap,
}) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          actionsPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.getSize(context: context, mobileValue: 15),
            ),
          ),
          content:
              title != null
                  ? Padding(
                    padding: EdgeInsets.all(
                      AppSize.getSize(context: context, mobileValue: 20),
                    ),
                    child: SizedBox(
                      height:
                          height ??
                          AppSize.getSize(
                            context: context,
                            mobileValue:
                                MediaQuery.of(context).size.height * 0.1,
                            tabletValue:
                                MediaQuery.of(context).size.height * 0.14,
                          ),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.getSize(
                                context: context,
                                mobileValue: 20,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (description != null)
                            CustomTextMultipleLigne(
                              description,
                              textAlign: TextAlign.center,
                              fontSize: AppSize.getSize(
                                context: context,
                                mobileValue: 16,
                                tabletValue: 24,
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                  : content ?? const SizedBox.shrink(),
          actions:
              hideAction == true
                  ? [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              AutoRouter.of(context).maybePop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 2,
                                    color: Colors.grey.withValues(alpha: 0.2),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSize.getSize(
                                    context: context,
                                    mobileValue: 16,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'D\'ACCORD',
                                    style: TextStyle(
                                      color: const Color(0xffAB5F1C),
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSize.getSize(
                                        context: context,
                                        mobileValue: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                  : [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap:
                                onTap == null
                                    ? null
                                    : () {
                                      onTap();
                                    },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 2,
                                    color: Colors.grey.withValues(alpha: 0.2),
                                  ),
                                  right: BorderSide(
                                    width: 2,
                                    color: Colors.grey.withValues(alpha: 0.2),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSize.getSize(
                                    context: context,
                                    mobileValue: 16,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    yesText ?? 'Oui',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSize.getSize(
                                        context: context,
                                        mobileValue: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if (noOnTap != null) {
                                noOnTap();
                              } else {
                                AutoRouter.of(context).maybePop();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 2,
                                    color: Colors.grey.withValues(alpha: 0.2),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSize.getSize(
                                    context: context,
                                    mobileValue: 16,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    noText ?? 'CONTINUER',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSize.getSize(
                                        context: context,
                                        mobileValue: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
        ),
  );
}
