import 'package:clg/common/widgets/icons/t_circular_icon.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAppToCart extends StatelessWidget {
  const TBottomAppToCart({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelpFunctions.isDarkMode(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace,vertical: TSizes.defaultSpace /2 ),
      decoration: BoxDecoration(
        color: dark ? TColors.darkGrey : TColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                  icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              SizedBox(width: TSizes.spaceBtwItems,),
              Text('2',style: Theme.of(context).textTheme.titleSmall,),
              SizedBox(width: TSizes.spaceBtwItems,),
              TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
          
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: BorderSide(color: TColors.black),
            ),
            child: Text('Add to cart'),
          ),
        ],
      ),
      
    );
  }
}
