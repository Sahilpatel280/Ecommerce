import 'package:clg/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:clg/common/widgets/image/t_circular_image.dart';
import 'package:clg/common/widgets/text/product_price_text.dart';
import 'package:clg/common/widgets/text/t_brand_title_text.dart';
import 'package:clg/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:clg/utils/constants/enums.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelpFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price Sale Price
        Row(
          children: [
            /// Sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color:  TColors.black)),
            ),
            SizedBox(width: TSizes.spaceBtwItems,),
            /// Price
            Text('\$250',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            SizedBox(width: TSizes.spaceBtwItems,),
            TProductPriceText(price: '175',isLarge: true,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems /1.5,),
        /// title
        TProductTitleText(title: 'Green Nike Sports Shirt',),
        SizedBox(height: TSizes.spaceBtwItems /1.5,),
        /// Stock Status
        Row(
          children: [
            TProductTitleText(title: 'Status',),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems /1.5,),
        /// Brand

        Row(
          children: [
            TCircularImage(image: TImages.nikeIcon,
            width: 32,
            height: 32,
              overlayColor: darkMode? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(title: 'Nike',brandTextSize: TextSizes.medium,),
            
          ],
        ),

      ],
    );
  }
}