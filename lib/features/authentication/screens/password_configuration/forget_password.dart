  import 'package:clg/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Get.back(), icon:  Icon(CupertinoIcons.clear),),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text(TTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections * 2,),
            ///Text Filed
            TextFormField(
              decoration: InputDecoration(labelText: TTexts.email,prefixIcon: Icon(Iconsax.direct_right),),
            ),
            ///submit Button
            SizedBox(height: TSizes.spaceBtwSections,),

            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => Get.to(() => ResetPassword()), child: Text(TTexts.submit))),
            SizedBox(height: TSizes.spaceBtwItems,),


          ],
        ),
      ),
    );
  }
}
