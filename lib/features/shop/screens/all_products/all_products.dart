import 'package:clg/common/widgets/layouts/grid_layout.dart';
import 'package:clg/common/widgets/products/product_card/product_cart_vertical.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Popular Products') ,showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  onChanged: (value) {},
                   items: [
                     'Name','Higher Price','Lower Price','Sale','Newest','Popularity']
                       .map((option)  => DropdownMenuItem(
                       value: option, child: Text(option)))
                       .toList(),
              ),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// Products
              TGridLayout(itemCount: 10, itemBuilder: (_ ,index) => TProductCartVertical())
            ],
          ),
        ),
      ),
    );
  }
}
