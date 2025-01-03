import 'package:clg/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/constants/text_strings.dart';
import 'package:clg/utils/device/device_utility.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../widgets/onboarding_dot_navigation.dart';
import '../widgets/onboarding_next_button.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTittle1,
                subTitle: TTexts.onBoardingSubTittle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTittle2,
                subTitle: TTexts.onBoardingSubTittle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTittle3,
                subTitle: TTexts.onBoardingSubTittle3,
              ),
            ],
          ),
          /// skip Button
          OnBoardingSkip(),

          /// Dot navigation

          /// circular Button

          OnBoardingNextButton(controller: controller,),
        ],
      ),
    );
  }
}







