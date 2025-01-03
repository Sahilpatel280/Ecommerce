// import 'dart:convert';
//
// import 'package:clg/common/widgets/success_screen/success_screen.dart';
// import 'package:clg/features/authentication/screens/login/login.dart';
// import 'package:clg/features/authentication/screens/signup_widgets/widgets/otpfrom.dart';
// import 'package:clg/utils/helpers/helper_functions.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/constants/text_strings.dart';
//
// class VerifyEmailScreen extends StatefulWidget {
//   var email;
//    VerifyEmailScreen({super.key, required this.email});
//
//
//   @override
//   State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
// }
//
// class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
//   TextEditingController otpController = TextEditingController();
//   final _otpKey = GlobalKey<FormState>();
//   bool isLoading = false;
//
//   Future<void> verifyOtp() async {
//     if (_otpKey.currentState!.validate()) {
//       setState(() {
//         isLoading = true;
//       });
//
//
//       try {
//         final response = await http.post(
//           Uri.parse('https://degmarkservice.hirenow.co.in/api/user-verification'),
//           headers: {'Content-Type': 'application/json'},
//           body: json.encode({'token': otpController.text,'email':widget.email.toString()}),
//         );
//
//         setState(() {
//           isLoading = false;
//         });
//
//
//         if (response.statusCode == 200) {
//           final responseData = json.decode(response.body);
//
//           if (responseData['success'] == true) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("OTP Verified Successfully!")),
//             );
//
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(responseData['message'] ?? "Invalid OTP. Please try again.")),
//             );
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Server error. Please try again later.")),
//           );
//         }
//       } catch (e) {
//         setState(() {
//           isLoading = false;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("An error occurred. Please try again.")),
//         );
//       }
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(onPressed: () => Get.offAll(() =>  LoginScreen()), icon:  Icon(CupertinoIcons.clear))
//         ],
//       ),
//       body:  SingleChildScrollView(
//         child: Padding(
//             padding: EdgeInsets.all(TSizes.defaultSpace),
//             child: Column(
//               children: [
//               ///Image
//               Image(image: AssetImage(TImages.deliveryEmailIllustration), width: THelpFunctions.screenWidth() * 0.6,),
//               SizedBox(height: TSizes.spaceBtwSections,),
//
//               ///Title& sub title
//               Text(TTexts.verification_Code,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
//               SizedBox(height: TSizes.spaceBtwItems,),
//                 Text(TTexts.verificationSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
//                   SizedBox(height: TSizes.spaceBtwSections,),
//               // Text('support@sahil.com', style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
//               //   SizedBox(height: TSizes.spaceBtwItems,),
//               //   Text(TTexts.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
//               //   SizedBox(height: TSizes.spaceBtwSections,),
//
//
//                 /// otp verification code
//                  Form(
//                    key:  _otpKey ,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         keyboardType: TextInputType.number,
//                         maxLength: 6,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.lock),
//                           labelText: "OTP",
//                           hintText: "Enter 6-digit OTP",
//                           border: OutlineInputBorder(),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: TSizes.spaceBtwSections,),
//                 ///button
//                 SizedBox(width: double.infinity,child: ElevatedButton(
//                   onPressed: isLoading ? null : verifyOtp,
//                   child: isLoading
//                       ? CircularProgressIndicator(color: Colors.white)
//                       : Text("Verify OTP"),
//                   //   onPressed: () => Get.to(() => SuccessScreen(
//                   // image: TImages.staticSuccessIllustration,
//                   // title: TTexts.yourAccountCreatedTitle,
//                   // subtitle: TTexts.yourAccountCreatedSubTitle,
//                   // onPressed: () => Get.to((
//                   //     ) => LoginScreen() )
//                   // ),
//                   )),
//                 SizedBox(height: TSizes.spaceBtwItems,),
//                 SizedBox(width: double.infinity,child:TextButton(onPressed: () {}, child: Text(TTexts.resendEmail))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:clg/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';


class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({Key? key, required this.email,}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final _otpKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> verifyOtp() async {
    if (_otpKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        final response = await http.post(
          Uri.parse('https://degmarkservice.hirenow.co.in/api/user-verification'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(
              {'token': otpController.text, 'email': widget.email}),
        );

        setState(() {
          isLoading = false;
        });

        if (response.statusCode == 200) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );

          final responseData = json.decode(response.body);

          if (responseData['success'] == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("OTP Verified Successfully!"),
              ),
            );

          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(
                  responseData['message'] ?? "Invalid OTP. Please try again.")),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Server error. Please try again later.")),
          );
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred. Please try again.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all( TSizes.defaultSpace),
          child: Form(
            key: _otpKey,
            child: Column(
              children: [
                Image(image: AssetImage(TImages.deliveryEmailIllustration), width: THelpFunctions.screenWidth() * 0.5,),
                SizedBox(height: TSizes.spaceBtwSections,),
        
                ///Title& sub title
                Text(TTexts.verification_Code,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwItems,),
                SizedBox(height: 20),
                TextFormField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "OTP",
                    hintText: "Enter 6-digit OTP",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the OTP";
                    } else if (value.length != 6) {
                      return "OTP must be 6 digits";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(width: double.infinity,child: ElevatedButton(
                  onPressed:
                    isLoading ? null : verifyOtp,
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Verify OTP"),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





