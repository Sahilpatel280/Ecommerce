import 'package:clg/common/styles/shadows.dart';
import 'package:clg/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:clg/common/widgets/image/t_round_image.dart';
import 'package:clg/features/shop/screens/product_details/product_details.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/enums.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../icons/t_circular_icon.dart';
import '../../text/product_price_text.dart';
import '../../text/product_title_text.dart';
import '../../text/t_brand_title_text_with_verified_icon.dart';

class TProductCartVertical extends StatelessWidget {
  const TProductCartVertical({super.key });

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    /// container with side padding, colors, edges, radius,and shadows,
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail()),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white
        ),
        child: Column(
          children: [
            /// Thumbnail, wishlist button,Discount tag
            TRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark: TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail image
                  TRoundedImage(imageUrl: TImages.productImage1,applyImageRadius:true,),

                  /// -- sale tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                    ),
                  ),
                  /// -- Favourite Icon Button
                  Positioned(
                    top: 0,
                      right: 0,
                      child: TCircularIcon(icon: Iconsax.heart5,color: Colors.red,)),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems/2),
            /// details
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child:SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     TProductTitleText(title: 'Green Nike',smallSize: true,),
                     SizedBox(height: TSizes.spaceBtwItems/ 2,),
                     TBrandTitleWithVerifiedIcon(title: 'Nike',),
                   ],
                ),
              ),
            ),
            Spacer(),
            /// price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.only(left: TSizes.sm),
                 child : TProductPriceText(price: '35.0', ),
               ),
                Container(
                  decoration: BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(child: Icon(Iconsax.add,color: TColors.white))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}







