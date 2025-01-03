import 'package:clg/common/widgets/app_bar/appbar.dart';
import 'package:clg/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:clg/common/widgets/image/t_circular_image.dart';
import 'package:clg/common/widgets/listtile/settings_menu_tile.dart';
import 'package:clg/common/widgets/text/selection_heading.dart';
import 'package:clg/features/personalization/screens/address/address.dart';
import 'package:clg/features/shop/screens/order/order.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/widgets/listtile/user_profile_tile.dart';
import '../../../authentication/screens/login/login.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                      title: Text('Account',
                          style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),

                  /// -- user Profile Card
                  TUserProfileTile(onPressed: () => Get.to(() => ProfileScreen())),
                  SizedBox(height: TSizes.spaceBtwSections,),
                ],
              ),
            ),
            /// -- body
            Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(title: 'Account Settings',showActionButton: false,),
                  SizedBox(height: TSizes.spaceBtwItems),

                  TSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set Shopping delivery address',
                    onTap: () => Get.to(() => UserAddressScreen()),
                  ),
                  TSettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout'),
                  TSettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and completed Orders',
                    onTap: () => Get.to(() => OrderScreen()),
                  ),
                  TSettingMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account'),
                  TSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons'),
                  TSettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message'),
                  TSettingMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts'),

                  /// -- App settings
                  SizedBox(height: TSizes.spaceBtwSections,),
                  TSectionHeading(title: 'App Settings',showActionButton: false,),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  TSettingMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud FireBase'),
                  TSettingMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(value: true,onChanged: (value){}),
                  ),TSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages ',
                    trailing: Switch(value: false,onChanged: (value){}),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false,onChanged: (value){}),
                  ),

                  /// -- Logout button
                  SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () async {
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          preferences.clear();

                          print("this data ----${preferences.getString("access_token")}");

                          setState(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          });

                        },child: Text('Logout',style: TextStyle(color: TColors.black))),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections * 2.5,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

