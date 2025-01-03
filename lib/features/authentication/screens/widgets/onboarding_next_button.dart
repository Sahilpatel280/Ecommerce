import 'package:clg/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:clg/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatefulWidget {
  const OnBoardingNextButton({
    super.key,
    required this.controller,
  });

  // static const String KEYLOGIN = "Login";

  final OnBoardingController controller;

  @override
  State<OnBoardingNextButton> createState() => OnBoardingNextButtonState();
}

class OnBoardingNextButtonState extends State<OnBoardingNextButton> {


  // static const String KEYLOGIN = "Login";
  // /// Shared perf
  // void getStart() async{
  //   var sharedPref = await SharedPreferences.getInstance();
  //   var isLogin = sharedPref.getBool(KEYLOGIN);
  //
  //   if(isLogin!=null){
  //     if(isLogin){
  //       //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Getstartscreen(),));
  //     }else{
  //       //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginscreen(),));
  //     }
  //   }else{
  //    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginscreen(),));
  //   }
  // }
  //

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelpFunctions.isDarkMode(context);

    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 820,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.controller.currentPageIndex > 0
                ? TextButton(
                    onPressed: () {
                      widget.controller.PrevPage();
                    },
                    child: const Text(
                      "Prev",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : SizedBox(
                    width: 20,
                  ),

            SmoothPageIndicator(
              controller: controller.pageController,
              onDotClicked: controller.dotNavigationClick,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: dark ? TColors.light : TColors.dark,
                  dotHeight: 6),
            ),

            // "Next" or "Get Started" button
            widget.controller.currentPageIndex == widget.controller.totalPage - 1
                ? TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      // getStart();
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(color: Colors.black), // Optional styling
                    ),
                  )
                : TextButton(
                    onPressed: widget.controller.NextPage,
                    // Use camelCase for method name
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.black), // Optional styling
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
