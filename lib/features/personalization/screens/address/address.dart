import 'package:clg/common/widgets/app_bar/appbar.dart';
import 'package:clg/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:clg/features/personalization/screens/address/add_new_address.dart';
import 'package:clg/features/personalization/screens/address/widgets/single_address.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => Get.to(() => AddNewAddressScreen()),
        backgroundColor: TColors.primary,
        child: Icon(Iconsax.add,color: TColors.white,),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(selectedAddress: false),
              TSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
