import 'package:clg/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/selection_heading.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address',buttonTitle: 'Change',onPressed: (){},),
        Text( "Coding With S",style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: TSizes.spaceBtwItems /2,),
        Row(
          children: [
            Icon(Icons.phone,color: Colors.grey,size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('+91 9324560074',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems /2,),

        Row(
          children: [
            Icon(Icons.location_history,color: Colors.grey,size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: Text('E 202 RatnaSagar, NewRanip, India',style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)),

          ],
        ),
      ],
    );
  }
}
