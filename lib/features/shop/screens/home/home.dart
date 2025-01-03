
import 'package:clg/common/widgets/products/product_card/product_cart_vertical.dart';
import 'package:clg/features/shop/screens/all_products/all_products.dart';
import 'package:clg/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:clg/features/shop/screens/home/widgets/home_categories.dart';
import 'package:clg/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/text/selection_heading.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            TPrimaryHeaderContainer(
                child:Column(
                  children: [
                    /// APP bar
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    ///  search bar
                    TSearchContainer(text: 'search in store',),

                    SizedBox(height: TSizes.spaceBtwItems,),
                    ///  categories
                    Padding(
                        padding:EdgeInsets.only(left:TSizes.defaultSpace),
                        child: Column(
                          /// heading multiple time to one time create
                         children: [
                          TSectionHeading(title: 'Popular Categories', showActionButton: false,textColor: TColors.white,),
                          SizedBox(height: TSizes.spaceBtwItems,),

                          /// Categories
                          THomeCategories(),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwSections,),
                  ],
                )
            ),


            /// body --
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// promo
                  TPromoSlider(banners: [TImages.promoBanner1,TImages.promoBanner2,TImages.promoBanner4],),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  /// Heading
                  TSectionHeading(title: 'Popular products', onPressed: () => Get.to(() => AllProducts()),),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  /// popular product
                  TGridLayout(itemCount: 2, itemBuilder: (_,index )  => TProductCartVertical()),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




















