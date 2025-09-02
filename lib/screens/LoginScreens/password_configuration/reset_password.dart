
import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_string.dart';
import '../SignInScreen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: dark?TColors.blackF : TColors.primaryBackground,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back(), icon:Icon(CupertinoIcons.clear))
          , SizedBox(width: TSizes.defaultSpace,)
        ],),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace * 1.5),
        child: Column(
          children: [
            SizedBox(height: TSizes.defaultSpace),
            Center(
              child: Image(
                image: AssetImage(TImages.verifyEmail),
                width: THelperFunctions.screenWidth() * 0.3,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Text(
              TTexts.passwordResetTittle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: dark ? TColors.white : TColors.blackF,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.passwordResetSubTittle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity.w,
              height: 55.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: TColors.primary,
                  foregroundColor: TColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {}
                ,
                child: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600),),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(TColors.primary ),
                  overlayColor: MaterialStateProperty.all(TColors.primary40 ),
                ),
                onPressed: () {
                },
                child: const Text('Resend Email' , style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}