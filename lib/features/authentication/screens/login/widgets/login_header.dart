import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final   dark  = THelpFunctions.isDarkMode(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
              height: 120,
              image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
          ),
          Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: TSizes.sm,),
          Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,)
        ]
    ) ;
  }
}

