import 'package:clg/common/widgets/app_bar/appbar.dart';
import 'package:clg/common/widgets/icons/t_circular_icon.dart';
import 'package:clg/common/widgets/products/product_card/product_cart_vertical.dart';
import 'package:clg/features/shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../utils/constants/sizes.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add,onPressed: () => Get.to(HomeScreen())),
        ],
      ),
      body : SingleChildScrollView(
        child : Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 6, itemBuilder: (_, index) => TProductCartVertical()),

            ],
          ),
        ),
      ),
    );
  }
}
