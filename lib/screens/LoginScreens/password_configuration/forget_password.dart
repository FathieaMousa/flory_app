import 'package:flory/features/authentaction/controllers/forget_password/forget_password_controller.dart';
import 'package:flory/screens/LoginScreens/password_configuration/reset_password.dart';
import 'package:flory/utils/constants/sizes.dart';
import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flory/utils/validators/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_string.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        ////automaticallyImplyLeading: false,
        backgroundColor: dark ? TColors.blackF :TColors.primaryBackground,
        scrolledUnderElevation: 0,

      ),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace,),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forget password', style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: dark ?TColors.white : TColors.blackF ,
                fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.forgetPasswordTittle , style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14
            ),),
            const SizedBox(height: TSizes.spaceBtwSections*2,),

            Form(
              key: controller.forgetPasswordFormKey ,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration:  InputDecoration(
                    enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: TColors.grey ,
                        )
                    ) ,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
              
                        borderSide: BorderSide(
                          color: TColors.primary ,
                        )
                    ),
                    labelText: 'E-Mail' ,
                    prefixIcon: Icon(Iconsax.direct_right)
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),
            SizedBox(
              height: 55.h,
              width: double.infinity.w,
              child: ElevatedButton(
                onPressed: ()=>controller.sendResetPasswordEmail(),
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (_)=>ResetPassword()));

                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.buttonPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child:  Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600 ,
                    color: TColors.primaryBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}