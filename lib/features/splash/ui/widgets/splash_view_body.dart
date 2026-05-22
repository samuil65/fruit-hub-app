import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_app/core/utils/constants/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.assetsImagesSplashplant)],
        ),
        SvgPicture.asset(Assets.assetsImagesSplashlogo, fit: BoxFit.none),
        SvgPicture.asset(Assets.assetsImagesSplashbottom, fit: BoxFit.fill),
      ],
    );
  }
}
