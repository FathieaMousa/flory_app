import 'package:flory/features/authentaction/controllers/login/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/theme/custom_themes/appBar_theme.dart';
import '../../features/authentaction/controllers/profile/edit_profile_controller.dart';
import '../../utils/constants/images_string.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final controller = Get.put(EditProfileController());
  //final controller = UserController.instance ;
  String ?  selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = controller.selectedGender.value;
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: dark ? TAppbarTheme.darkAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: [])
          :TAppbarTheme.lightAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: []) ,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Edit Profile",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color:dark?TColors.white :TColors.dark),)),
              SizedBox(height: 60.h,),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(TImages.women,width: 108.w,height: 108.h),
                    SizedBox(width: 20.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(controller.fullNameController.text,style: TextStyle(fontSize: 20.sp,color:dark?TColors.white :TColors.dark),),
                        Text(controller.emailController.text,style: TextStyle(fontSize: 15.sp,color: TColors.primary),),
                        SizedBox(height: 14.h,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r)
                              ),
                              backgroundColor: TColors.primary,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 27.w,vertical: 8.h),

                            ),
                            onLongPress: (){},
                            onPressed: (){},
                            child: Text("Upload Photo",style: TextStyle(fontSize: 16.sp),)),

                      ],
                    ),

                  ]
              ),
              SizedBox(height: TSizes.spaceBtwSections.h,),
              Text("Name",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
              SizedBox(height: 5.h,),
              Form(

                child: TextFormField(
                  style: TextStyle(fontSize: 20.sp),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: controller.fullNameController.text,
                      hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                      filled: true,
                      fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white

                  ),),
              ),

              SizedBox(height:  TSizes.spaceBtwInputFields.h),
              Text("Email",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
              SizedBox(height: 5.h,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 20.sp),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.only(left: 15.w),
                    hintText: controller.emailController.text,
                    hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                    filled: true,
                    fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white

                ),),
              SizedBox(height:  TSizes.spaceBtwInputFields.h),
              Text("Phone Number",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
              SizedBox(height: 5.h,),
              TextFormField(
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 20.sp),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.only(left: 15.w),
                    hintText: controller.phoneNumController.text,
                    hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                    filled: true,
                    fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white,


                ),),
              SizedBox(height:  TSizes.spaceBtwInputFields.h),
              SizedBox(height: 5.h),
              Text("Gender",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color:dark? TColors.white:Colors.black),),
              SizedBox(height: 5.h,),

              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: dark ? TColors.white.withOpacity(0.2): Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                ),
                value: selectedGender,
                items: ["Male", "Female","Other"].map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender,style: TextStyle(
                        color: TColors.primary70
                    ),),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              SizedBox(height: TSizes.spaceBtwSections.h),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r)
                      ),
                      backgroundColor: TColors.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 140.w,vertical:5.h),

                    ),
                    onLongPress: (){},
                    onPressed: (){},
                    child: Text("Save",style: TextStyle(fontSize: 18.sp,fontFamily: "Inter"),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}