import 'package:clg/common/widgets/app_bar/appbar.dart';
import 'package:clg/common/widgets/image/t_round_image.dart';
import 'package:clg/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:clg/common/widgets/text/selection_heading.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sports'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TRoundedImage(width: double.infinity,imageUrl: TImages.promoBanner4,applyImageRadius: true,),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// Sub -Categories

              Column(
                children: [
                  /// Heading
                  TSectionHeading(title: 'Sports shirts',onPressed: (){},),
                  SizedBox(height: TSizes.spaceBtwItems / 2,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItems,),
                        itemBuilder:(context, index) => TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
