import 'package:clg/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:clg/common/widgets/text/product_price_text.dart';
import 'package:clg/common/widgets/text/product_title_text.dart';
import 'package:clg/common/widgets/text/selection_heading.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- selected Attribute Pricing & Description
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              /// title, price, and stock Staus
              Row(
                children: [
                  TSectionHeading(title: 'Variation',showActionButton: false,),
                  SizedBox(width:TSizes.spaceBtwItems,),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TProductTitleText(title: 'Price : ',smallSize: true,),
                          SizedBox(width:TSizes.spaceBtwItems,),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width:TSizes.spaceBtwItems,),

                          /// Sale Price
                          TProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          TProductTitleText(title: 'Stock : ',smallSize: true,),
                          SizedBox(width:TSizes.spaceBtwItems,),
                          Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              /// Variation Description
              TProductTitleText(
                title:'This is the Description of the product and it can go Upto max 4 lines.',
                smallSize: true,
                maxLine: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),


        /// -- Attribute

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Colors'),
            SizedBox(height: TSizes.spaceBtwItems / 2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true,onSelected: (value){},),
                TChoiceChip(text: 'Blue', selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Yellow', selected: false,onSelected: (value){}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Size'),
            SizedBox(height: TSizes.spaceBtwItems / 2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true,onSelected: (value){},),
                TChoiceChip(text: 'EU 36', selected: false,onSelected: (value){},),
                TChoiceChip(text: 'EU 38', selected: false,onSelected: (value){},),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


