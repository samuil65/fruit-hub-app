import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub_app/features/auth/ui/views/login_view.dart';
import 'package:gap/gap.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.backgroundImage,
    required this.isVisible,
  });

  final String title, subTitle;
  final String image, backgroundImage;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              // Logo image
              Positioned(
                left: 75,
                right: 75,
                bottom: 12,
                child: SvgPicture.asset(image),
              ),
              // Skip
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Prefs.setBool(kIsOnBoardingSeen, true);
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'تخطي',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(20),
        // Title Image
        SvgPicture.asset(title, height: 40),
        Gap(30),
        // Subtitle Text
        SizedBox(
          width: 400,
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF4E5556),
              fontSize: 13,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w800,
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }
}
