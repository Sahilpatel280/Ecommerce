import 'package:clg/common/widgets/text/selection_heading.dart';
import 'package:clg/features/shop/screens/product_details/widgets/bottom_add_to_card_widget.dart';
import 'package:clg/features/shop/screens/product_details/widgets/product_attrbutes.dart';
import 'package:clg/features/shop/screens/product_details/widgets/product_details_image_silder.dart';
import 'package:clg/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:clg/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:clg/features/shop/screens/product_review/product_reviews.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, this.product});

  final  product;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: TBottomAppToCart(),
      body: SingleChildScrollView(

        child: Column(
          children: [
            /// 1. Product Image Slider
            TProductImageSlider(product:product),

            /// 2. Product detail
            Padding(padding: EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  TRatingAndShare(),

                  /// price,title,Stock & Brand
                  TProductMetaData(),

                  /// Attribute
                  TProductAttributes(),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  /// Checkout Button
                  SizedBox(width:double.infinity,child: ElevatedButton(onPressed: (){}, child:Text('Checkout'))),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  /// Description
                  TSectionHeading(title: 'Description',showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less Vest, There are more things that can be added but i am just practicing and nothing else.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more ',
                    trimExpandedText: ' Less ',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),


                  /// Reviews
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Review(199)',showActionButton: false,),
                      IconButton(onPressed: () => Get.to(() => ProductReviewsScreen()), icon:Icon(Iconsax.arrow_right_3,size: 18,)),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




