import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../image/t_round_image.dart';
import '../../text/product_title_text.dart';
import '../../text/t_brand_title_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// --Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: THelpFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        SizedBox(width: TSizes.spaceBtwItems,),

        /// Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(child: TProductTitleText(title: 'Black Sports shoes',maxLine: 1,)),
              ///Attribute
              Text.rich(
                TextSpan(
                    children:[
                      TextSpan(text: 'Color',style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green',style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Size',style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'UK 06',style: Theme.of(context).textTheme.bodyLarge),
                    ]
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}