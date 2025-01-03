import 'package:clg/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder:  (_, index) => SizedBox(height: TSizes.spaceBtwItems,),
      itemBuilder: (_, index)  => TRoundedContainer(
        padding: EdgeInsets.all(TSizes.md),
        showBorder: true,
        backgroundColor: dark ? TColors.dark : TColors.light,
      
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
      
                /// 1 - Icon
                Icon(Iconsax.ship),
                SizedBox(width: TSizes.spaceBtwItems /2,),
      
                /// 2 - Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),
                      ),
                      Text('06 Dec 2024',style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
      
                /// 3 - Icon
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34 , size: TSizes.sm,)),
      
              ],
            ),
      
              SizedBox(height: TSizes.spaceBtwItems,),
            /// - Row2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      Icon(Iconsax.tag),
                      SizedBox(width: TSizes.spaceBtwItems /2,),
                  
                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',style: Theme.of(context).textTheme.labelMedium,),
                            Text('[#2565f2]',style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      Icon(Iconsax.calendar),
                      SizedBox(width: TSizes.spaceBtwItems /2,),
                  
                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',style: Theme.of(context).textTheme.labelMedium,),
                            Text(' 4 Feb 2025 ',style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
