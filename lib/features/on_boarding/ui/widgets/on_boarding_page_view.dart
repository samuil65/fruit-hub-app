import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/features/on_boarding/ui/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        // First Page
        PageViewItem(
          title: Assets.assetsImagesOnboardingtitle1,
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          image: Assets.assetsImagesOnboardinglogo1,
          backgroundImage: Assets.assetsImagesOnboardingbackground1,
          isVisible: true,
        ),

        // Second Page
        PageViewItem(
          title: Assets.assetsImagesOnboardingtitle2,
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          image: Assets.assetsImagesOnboardinglogo2,
          backgroundImage: Assets.assetsImagesOnboardingbackground2,
          isVisible: false,
        ),
      ],
    );
  }
}
