import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edge/curved_edge_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/image/t_round_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required product,


  });
  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(height: 400,child: Padding(
              padding:  EdgeInsets.all(TSizes.productImageRadius*2),
              child: Center(child: Image(image: AssetImage(TImages.productImage1))),
            )),

            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems,),
                  itemCount: 6,
                  itemBuilder: (_,index) =>
                      TRoundedImage(
                        width: 80,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(color: TColors.primary),
                        padding: EdgeInsets.all(TSizes.sm),
                        imageUrl: TImages.productImage3,),
                ),
              ),
            ),

            /// Appbar Icons

            TAppBar(showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5,color: Colors.red,),
              ],)

          ],
        ),
      ),
    );
  }
}