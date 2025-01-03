import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup_widgets/signup.dart';

class LoginFrom extends StatefulWidget {
  const LoginFrom({super.key});

  @override
  State<LoginFrom> createState() => _LoginFromState();
}

class _LoginFromState extends State<LoginFrom> {


  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  bool passwordVisible = true;
  bool confirmPasswordVisible = true;
  var access_token;
  var password;
  var email;
  var name;


  Future<void> loginApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    Map<String, dynamic> body = {

      'email': emailController.text,
      'password': passwordController.text,
      // 'access_token' : access_token,
    };
    final http.Response response = await http.post(
      Uri.parse('https://degmarkservice.hirenow.co.in/api/store-login'),
      headers:headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successfully!")),
      );
      var responseData = json.decode(response.body);
      access_token = responseData["access_token"];
      var user = responseData['user'];

      name = user["name"];
      email = user["email"];

      preferences.setString("access_token", access_token);

      print("login share----?   $access_token");



      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationMenu(),));

    } else {
      print("Login failed: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    return Form(
      key: _formKey,
      child:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            ///  Email
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null ||
                    !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                  return "Please enter a valid email";
                }
                return null;
              },
              decoration: InputDecoration(prefixIcon:Icon(Iconsax.direct_right), labelText: TTexts.email),
            ),
            SizedBox(height:  TSizes.spaceBtwInputFields),
            TextFormField(
              controller: passwordController,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
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
            SizedBox( height:  TSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                ///remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    Text(TTexts.rememberMe),
                  ],
                ),

                /// forget password
                TextButton(onPressed: () => Get.to(() => ForgetPassword()), child: Text(TTexts.forgetPassword)),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// sign  in button
            SizedBox(width: double.infinity,child: ElevatedButton(
                onPressed:(){
                  if (_formKey.currentState!.validate()) {
                    loginApi();
                  }
                },
                child: Text(TTexts.signIn))),
            SizedBox(height: TSizes.spaceBtwItems,),


            ///  create button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => SignupScreen()),
                child: Text(TTexts.createAccount,style: TextStyle(color: dark ? TColors.white: Colors.black)),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );

  }
}
