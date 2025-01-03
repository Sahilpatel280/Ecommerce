import 'package:clg/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image ,title, subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// image
              Image(image: AssetImage(image), width: THelpFunctions.screenWidth() * 0.6,),
              SizedBox(height: TSizes.spaceBtwSections,),

              ///Title& sub title
              Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: TSizes.spaceBtwItems,),
              Text(subtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// button
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPressed, child: Text(TTexts.tContinue))),
            ],
          ),
        ),
      ),
    );
  }
}
