import 'package:madeb75/gen/assets.gen.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons_widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class SplashBodyWidget extends StatelessWidget {
  const SplashBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.icons.icon.path, width: 200, height: 200),
            LoadingWidget(color: AppColors.primary),
          ],
        ),
      ],
    );
  }
}
