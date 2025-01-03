import 'package:clg/common/widgets/app_bar/tabbar.dart';
import 'package:clg/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:clg/common/widgets/custom_shapes/container/search_container.dart';
import 'package:clg/common/widgets/layouts/grid_layout.dart';
import 'package:clg/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:clg/common/widgets/text/selection_heading.dart';
import 'package:clg/common/widgets/brands/brand_card.dart';
import 'package:clg/features/shop/screens/store/widgets/category_tab.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/enums.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../common/widgets/image/t_circular_image.dart';
import '../../../../common/widgets/text/t_brand_title_text_with_verified_icon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        
        appBar : TAppBar(
          title: Text('Store',style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            TCartCounterIcon(OnPressed: (){}),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScorlled){
           return[
           SliverAppBar(
             automaticallyImplyLeading: false,
             pinned: true,
             floating: true,
             backgroundColor: THelpFunctions.isDarkMode(context) ? TColors.black : TColors.white,
             expandedHeight: 440,
             flexibleSpace: Padding(
               padding: EdgeInsets.all(TSizes.defaultSpace),
               child: ListView(
                 shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 children: [
                   /// search Bar
                   SizedBox(height: TSizes.spaceBtwItems,),
                   TSearchContainer(text: 'Search in store',showBorder: true,showBackground: false,padding: EdgeInsets.zero,),
                   SizedBox(height: TSizes.spaceBtwSections,),

                   /// -- Featured Brands
                   TSectionHeading(title: 'Featured Brands',onPressed: (){},),
                   SizedBox(height: TSizes.spaceBtwItems /1.5,),

                   TGridLayout(
                       itemCount:4, mainAxisExtent:80,itemBuilder: (_, index){
                     return  TBrandCard(showBorder: false,);
                   }),

                 ],
               ),
             ),
             bottom: TTabBar(
               tabs: [
               Tab(child: Text('Sports')),
               Tab(child: Text('Furniture')),
               Tab(child: Text('Electronics')),
               Tab(child: Text('Clothes')),
               Tab(child: Text('Cosmetics')),
             ],
             ),
           ),
         ];
        } , body: TabBarView(
           children: [
             TCategoryTab(),
             TCategoryTab(),
             TCategoryTab(),
             TCategoryTab(),
             TCategoryTab(),

          ],
        )
        ),
      ),
    );
  }
}






