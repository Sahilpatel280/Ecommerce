import 'dart:convert';

import 'package:clg/common/widgets/app_bar/appbar.dart';
import 'package:clg/common/widgets/image/t_circular_image.dart';
import 'package:clg/common/widgets/text/selection_heading.dart';
import 'package:clg/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/login/login.dart';
import '../../models/profiles/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String? token;
  Future<Profile>? _profile;

  @override
  void initState() {
    super.initState();
    getToken();

  }


  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("access_token");

    if (token != null) {
      setState(() {
        // Initialize the _profile future after token is retrieved
        _profile = getProfileData();
      });
    } else {
      // Handle case where token is not available (optional)
      print("No token found.");
    }
  }

  Future<Profile> getProfileData() async {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token', // Use the token from SharedPreferences
    };

    try {
      final http.Response response = await http.get(
        Uri.parse('https://degmarkservice.hirenow.co.in/api/portfolio'),
        headers: headers,

      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseJson = json.decode(response.body);
        return Profile.fromJson(responseJson);
      } else {
        throw Exception("Failed to load profile data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){},child: Text("Edit Profiles",style: TextStyle(fontSize: TSizes.fontSizeSm ),))
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:
        FutureBuilder<Profile>(
          future: _profile,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final user = snapshot.data!.user;
              return Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Profile Picture
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          TCircularImage(image: TImages.user,width: 80,height: 80,),
                          TextButton(onPressed: (){}, child: Text('Change Profile Picture')),
                        ],
                      ),
                    ),
                    /// Details

                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    TSectionHeading(title: 'Profile Information',showActionButton: false,),
                    SizedBox(height: TSizes.spaceBtwItems,),


                    TProfileMenu(onPressed: () {}, title: 'Name', value: "${user?.name ?? 'N/A'}"),
                    TProfileMenu(onPressed: () {}, title: 'Username', value: "${user?.userName ?? 'N/A'}"),

                    SizedBox(height: TSizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    TSectionHeading(title: 'Personal  Information',showActionButton: false,),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    TProfileMenu(onPressed: () {}, title: 'User ID',icon: Iconsax.copy, value: "${user?.id ?? 'N/A'}",),
                    TProfileMenu(onPressed: () {}, title: 'E-mail', value: "${user?.email ?? 'N/A'}",),
                    TProfileMenu(onPressed: () {}, title: 'Phone Number', value: "${user?.phone ?? 'N/A'}",),
                    TProfileMenu(onPressed: () {}, title: 'address', value: "${user?.address?? 'N/A'}",),
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text('Close Account', style: TextStyle(color: Colors.red),),
                      ),
                    ),

                  ],
                ),
              );
            } else {
              return Center(child: Text('No profile data found.'));
            }
          },
        ),
      ),
    );
  }
}

// Padding(
//           padding: EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               /// Profile Picture
//               SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     TCircularImage(image: TImages.user,width: 80,height: 80,),
//                     TextButton(onPressed: (){}, child: Text('Change Profile Picture')),
//                   ],
//                 ),
//               ),
//
//               /// Details
//
//               SizedBox(height: TSizes.spaceBtwItems / 2),
//               Divider(),
//               SizedBox(height: TSizes.spaceBtwItems,),
//               TSectionHeading(title: 'Profile Information',showActionButton: false,),
//               SizedBox(height: TSizes.spaceBtwItems,),
//
//
//               // TProfileMenu(onPressed: () {}, title: 'Name', value: result[index].user.name.toString(),),
//               // TProfileMenu(onPressed: () {}, title: 'Username', value: 'Coding With S',),
//
//               SizedBox(height: TSizes.spaceBtwItems),
//               Divider(),
//               SizedBox(height: TSizes.spaceBtwItems,),
//
//               TSectionHeading(title: 'Personal  Information',showActionButton: false,),
//               SizedBox(height: TSizes.spaceBtwItems,),
//
//               TProfileMenu(onPressed: () {}, title: 'User ID',icon: Iconsax.copy, value: '456048',),
//               TProfileMenu(onPressed: () {}, title: 'E-mail', value: 'Coding With S',),
//               TProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+92-316-46282267',),
//               TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male',),
//               TProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '28 May 2002',),
//               Divider(),
//               SizedBox(height: TSizes.spaceBtwItems,),
//
//               Center(
//                 child: TextButton(
//                 onPressed: (){},
//                   child: Text('Close Account', style: TextStyle(color: Colors.red),),
//                 ),
//               ),
//
//             ],
//           ),
//         ),