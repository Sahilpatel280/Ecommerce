import 'package:clg/common/widgets/login_signup/form_divider.dart';
import 'package:clg/common/widgets/login_signup/social_buttons.dart';
import 'package:clg/features/authentication/screens/signup_widgets/widgets/signup_form.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:clg/utils/constants/text_strings.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.signupTitle,style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              ///form
              const TSignupForm(),

              const SizedBox(height: TSizes.spaceBtwSections,),
              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections,),
              ///social button
             const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

