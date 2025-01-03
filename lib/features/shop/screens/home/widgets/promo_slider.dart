import 'package:carousel_slider/carousel_slider.dart';
import 'package:clg/features/shop/controllers/home_controller.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets/image/t_round_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(

          options: CarouselOptions(
            viewportFraction: 1.0,
            onPageChanged: (index,_) => controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => TRoundedImage(imageUrl:url)).toList(),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
        Center(
          child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < banners.length; i++)
                  TCircularContainer(
                      width: 20,
                      height: 4,
                      margin: EdgeInsets.only(right: 10),
                      backgroundColor: controller.carousalCurrentIndex.value == i
                          ? TColors.primary : TColors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}