import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_button.dart';
import 'package:fruit_hub_app/features/auth/ui/views/login_view.dart';
import 'package:fruit_hub_app/features/on_boarding/ui/widgets/on_boarding_page_view.dart';
import 'package:gap/gap.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        // Dots Indicator
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        Gap(29),
        // Button
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
              onPressed: () {
                Prefs.setBool(kIsOnBoardingSeen, true);
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        Gap(43),
      ],
    );
  }
}
