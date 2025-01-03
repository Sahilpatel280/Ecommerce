import 'package:clg/common/widgets/layouts/grid_layout.dart';
import 'package:clg/common/widgets/products/product_card/product_cart_vertical.dart';
import 'package:clg/common/widgets/text/selection_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children:[
        Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              TBrandShowcase(images: [TImages.productImage1,TImages.productImage2,TImages.productImage3]),
              TBrandShowcase(images: [TImages.productImage1,TImages.productImage2,TImages.productImage3]),
              /// -- Products

              TSectionHeading(title: 'You might like',showActionButton: true,onPressed: (){}),
              SizedBox(height: TSizes.spaceBtwItems,),

              TGridLayout(itemCount: 4, itemBuilder: (_, index) => TProductCartVertical())

            ],
          ),
      ),
    ],
    );
  }
}
