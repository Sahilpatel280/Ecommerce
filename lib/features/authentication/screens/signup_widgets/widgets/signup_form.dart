
import 'package:clg/features/authentication/screens/signup_widgets/verify_otp_email.dart';
import 'package:clg/features/authentication/screens/signup_widgets/widgets/otpfrom.dart';
import 'package:clg/features/authentication/screens/signup_widgets/widgets/terms_conditions_checkbox.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({
    super.key,
  });

  @override
  State<TSignupForm> createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPassController = TextEditingController();


  bool passwordVisible = true;
  bool confirmPasswordVisible = true;



  Future<void> registerapi() async {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    Map<String, dynamic> body = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': confirmationPassController.text
    };
    final http.Response response = await http.post(
      Uri.parse('https://degmarkservice.hirenow.co.in/api/store-register'),
      headers: headers,
      body: jsonEncode(body),
    );

    // Check if the response is successful
    if (response.statusCode == 201) {
      print("Registration successful");
      // Navigate to OTP verification screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen(email: emailController.text,)),
      );
    } else {
      // Show an error message if registration fails
      print("Registration failed: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed. Please try again.")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:Column (
        children: [
          ///user name
          TextFormField(
            controller: nameController,
            expands : false,
            decoration: InputDecoration(
                labelText: TTexts.userName,
                prefixIcon: Icon(Iconsax.user_edit)
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          /// email
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct),
            ),
            validator: (value) {
              if (value == null ||
                  !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                return "Please enter a valid email";
              }
              return null;
            },
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          ///password
          TextFormField(
            controller: passwordController,
            obscureText: passwordVisible,
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon:  Icon(passwordVisible ? Iconsax.eye_slash : Iconsax.eye),
              ),
            ),
            validator: (value) {
              if (value == null || value.length < 8) {
                return "Password must contain a number";
              }else
                return null; // Return null if the validation passes
            },
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          /// confirm password
          TextFormField(
            controller: confirmationPassController,
            obscureText: passwordVisible,
            decoration: InputDecoration(
              labelText: TTexts.confirmationPassword,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                icon:  Icon(passwordVisible ? Iconsax.eye_slash : Iconsax.eye),
              ),
            ),
            validator: (value) {
              if (value == null || value.length < 8) {
                return "Password must contain a number";
              }else
                return null; // Return null if the validation passes
            },
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          /// Terms & conditions
          TTermsAndConditionCheckBox(),

          SizedBox(height: TSizes.spaceBtwSections,),
          /// Create Account
          SizedBox(
              width: double.infinity,child: ElevatedButton(
              onPressed: () {

                setState(() {
                  if (_formKey.currentState!.validate()) {
                    registerapi();
                  }
                });
              },
              child: Text(TTexts.createAccount))),
        ],
      ),);
  }
}

