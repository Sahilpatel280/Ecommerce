import 'package:clg/common/widgets/app_bar/appbar.dart';
import 'package:clg/features/shop/screens/product_review/widgets/progress_indicator_and_rating.dart';
import 'package:clg/features/shop/screens/product_review/widgets/rating_progress_indicator.dart';
import 'package:clg/features/shop/screens/product_review/widgets/review_details_container.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/colors.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// -- App bar

      appBar: TAppBar(title: Text('Review & Ratings'),showBackArrow: true,),


      /// - body
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating and Review are verified and are from people who use the same type of device that you use.',),
            SizedBox(height: TSizes.spaceBtwItems,),

            /// -- Overall Product Rating
            TOverallProductRating(),
            TRatingBarIndicator(rating: 3.5,),
            Text('12,911',style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: TSizes.spaceBtwSections,),

            /// -- user review

            UserReviewCard(),
            UserReviewCard(),
            UserReviewCard(),
            UserReviewCard(),


          ],
        ),
      ),

    );
  }
}






