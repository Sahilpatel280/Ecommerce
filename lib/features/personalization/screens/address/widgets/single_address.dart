import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark  = THelpFunctions.isDarkMode(context);
    return TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
          borderColor: selectedAddress ? Colors.transparent
                        : dark
                          ?TColors.darkGrey :TColors.grey,
          margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null ,
                  color: selectedAddress
                        ? dark
                          ?TColors.light
                          :TColors.dark
                      :null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sahil Patel',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: TSizes.sm / 2,),
                  Text('(+91) 8128965540',maxLines: 1,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: TSizes.sm/ 2,),
                  Text('E-202 Ratna sager Heights,Anand Party plot,Newranip,382480,India ',softWrap: true,),
                ],
              ),
            ],
          ),
        );
  }
}
