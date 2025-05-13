import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:flutter/material.dart';

class RoundedWidget extends StatelessWidget {
  final bool? active;
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  const RoundedWidget({
    super.key,
    this.active = false,
    this.color,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 20,
      height: height ?? 20,
      decoration: BoxDecoration(
        color:
            color ??
            (active != null && active!
                ? AppColors.primary.withValues(alpha: 0.2)
                : Colors.grey[300]),
        shape: BoxShape.circle,
        border: Border.all(
          color:
              color ??
              (active != null && active!
                  ? AppColors.primary
                  : Colors.grey[400]!),
          width: 2,
        ),
      ),
      child: Center(
        child:
            child ??
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color:
                    color ??
                    (active != null && active!
                        ? AppColors.primary
                        : Colors.grey[400]),
                shape: BoxShape.circle,
              ),
            ),
      ),
    );
  }
}
