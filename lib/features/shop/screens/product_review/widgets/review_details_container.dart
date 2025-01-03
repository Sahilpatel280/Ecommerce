import 'package:clg/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:clg/common/widgets/products/ratings/rating_indicator.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context){
  final dark = THelpFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1),),
                SizedBox(width:TSizes.spaceBtwItems,),
                Text('John Roe',style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],
        ),

        /// Review

        Row(
          children: [
            TRatingBarIndicator(rating:4 ),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 May, 2021', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
        ReadMoreText(
          'During demo by whirlpool engineer, the product found full body dent and committed us to replace the same. But not replaced till date.',
           trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),

        /// -- Company review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Text( "T's Store",style: Theme.of(context).textTheme.titleMedium,),
                    Text("02 Nov 2021",style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItems,),
                ReadMoreText(
                  'During demo by whirlpool engineer, the product found full body dent and committed us to replace the same. But not replaced till date.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
