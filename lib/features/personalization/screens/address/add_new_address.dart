import 'package:clg/common/widgets/app_bar/appbar.dart';
import 'package:clg/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),),
                SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),),
                SizedBox(height: TSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),)),
                    SizedBox(width: TSizes.spaceBtwInputFields,),
                    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Postal code'),)),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'),)),
                    SizedBox(width: TSizes.spaceBtwInputFields,),
                    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),)),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),),
                SizedBox(height: TSizes.defaultSpace,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){},child:Text('Save') ,) ,)
              ],

            ),
          ),
        ),
      ),
    );
  }
}


