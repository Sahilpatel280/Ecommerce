import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/text/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [

          /// Cart Item
          TCartItem(),
          if(showAddRemoveButton) SizedBox(height: TSizes.spaceBtwItems,),

          /// Add remove Button Row with total prize
          if(showAddRemoveButton)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [

                  /// Extra Space
                  SizedBox(width: 70,),

                  /// Add Remove Button
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),

              /// -- Product Prize
              TProductPriceText(price: '254',),

            ],
          ),
        ],
      ) ,
    );
  }
}
