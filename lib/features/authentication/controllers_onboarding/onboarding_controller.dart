
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  /// variable
  final pageController = PageController();
  Rx<int>currentPageIndex = 0.obs;
  /// update current Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & jump to next page
  void nextPage() {
    if(currentPageIndex.value == 2  ){
     Get.offAll(LoginScreen());
    }else{
      int page = currentPageIndex.value  +1;
      pageController.jumpToPage(page);
    }
  }

  ///  Update Current Index $ Jump to the last page
  void skipPage() {
    currentPageIndex.value =2;
    pageController.jumpToPage(2);
  }

  int totalPage = 3;
  void PrevPage() {
    if (currentPageIndex > 0) { // Adjusted to prevent overflow (index starts at 0)
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void NextPage() {
    if (currentPageIndex < totalPage - 1) { // Prevent overflow at the end
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}