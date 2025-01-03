
import 'dart:convert';

import 'package:clg/common/styles/spacing_styles.dart';
import 'package:clg/features/authentication/screens/login/widgets/login_from.dart';
import 'package:clg/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../password_configuration/forget_password.dart';
import '../signup_widgets/signup.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            /// Logo, Tittle & sub -title
            children: [
                  const TLoginHeader(),

                  ///form

                  LoginFrom(),

                  /// Divider
                  TFormDivider(dividerText : TTexts.orSignInWith.capitalize!),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  ///Footer

                  const TSocialButtons(),
            ],
          ),
          ),
        ),
    );
  }
}







