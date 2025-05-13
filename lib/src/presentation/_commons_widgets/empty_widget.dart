import 'package:madeb75/gen/assets.gen.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.iconData, required this.text, this.image});
  final IconData? iconData;
  final SvgGenImage? image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            image!.svg(
              height: AppSize.getSize(context: context, mobileValue: 100),
              width: AppSize.getSize(context: context, mobileValue: 100),
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          if (iconData != null)
            Icon(
              iconData,
              size: AppSize.getSize(context: context, mobileValue: 100),
              color: Colors.grey,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: AppSize.getSize(context: context, mobileValue: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
