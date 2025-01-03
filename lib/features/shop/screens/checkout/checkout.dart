import 'package:clg/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:clg/common/widgets/success_screen/success_screen.dart';
import 'package:clg/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:clg/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:clg/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:clg/features/shop/screens/checkout/widgets/billing_payment_sections.dart';
import 'package:clg/navigation_menu.dart';
import 'package:clg/utils/constants/colors.dart';
import 'package:clg/utils/constants/image_strings.dart';
import 'package:clg/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widgets.dart';
import '../../../../utils/constants/sizes.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              /// - Item Cart
              TCartItems(showAddRemoveButton: false,),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// -- Coupan TextFild
              TCouponCode(),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// -- Billing Sections

              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor:  dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    /// Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    /// Address
                    TBillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

      ///
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: TImages.successfulPaymentIcon,
                      title: 'Payment Success!',
                      subtitle: 'You item will be shipped soon!',
                      onPressed: () => Get.offAll(() => NavigationMenu()),
                    ),
            ),
            child: Text('Checkout \$254.0')),
      ),
    );
  }
}


