import 'package:clg/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:clg/features/shop/screens/checkout/checkout.dart';
import 'package:clg/utils/constants/sizes.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/app_bar/appbar.dart';

import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),),
      body:Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ) ,

      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => CheckoutScreen()),child: Text('Checkout \$254.0')),
      ),
    );
  }
}




