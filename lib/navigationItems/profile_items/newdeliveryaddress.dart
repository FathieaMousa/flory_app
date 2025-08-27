import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/custom_themes/appBar_theme.dart';
import '../../utils/theme/custom_themes/text_theme.dart';

class Newdeliveryaddress extends StatefulWidget {
  const Newdeliveryaddress({super.key});

  @override
  State<Newdeliveryaddress> createState() => _NewdeliveryaddressState();
}

class _NewdeliveryaddressState extends State<Newdeliveryaddress> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: dark ?TAppbarTheme.darkAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: [
            SizedBox(width: 150.w),
            CircleAvatar(
                backgroundColor: TColors.primary40,
                radius: 40.r,
                child:Icon(Iconsax.location,size: 40.sp,color: Colors.white,)
            ),
            SizedBox(width: 30.w),
          ]) : TAppbarTheme.lightAppBarTheme(leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: IconButton(icon:Icon(Iconsax.arrow_left_2), iconSize: 40.r,
          onPressed: () {
            Get.back();
          }, ),
      ),
          actions: [
            SizedBox(width: 150.w),
            CircleAvatar(
                backgroundColor: TColors.primary40,
                radius: 40.r,
                child:Icon(Iconsax.location,size: 40.sp,color: Colors.white,)
            ),
            SizedBox(width: 30.w),
          ]) ,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 0.h),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("New Delivery Address",style: TextStyle(fontFamily: "LibreBaskerville",fontSize: 24.sp,color: dark ? TColors.white :Colors.black),)),
            SizedBox(height: 15.h),
            Text(
              "We’ll ship it to your address below:",
              style: TTextTheme.lightTextTheme.titleLarge?.copyWith(
                fontSize: 20.sp,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 18.h,),
            Text("Address Title",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: dark ? TColors.white :Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: "Apartment 2",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: dark ? Colors.white.withOpacity(0.2) :Colors.white

              ),),
            SizedBox(height: 22.h),
            Text("Choose Location",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: dark ? TColors.white :Colors.black),),
            SizedBox(height: 12.h,),
            Container(
              width: 400.w,
              height: 250.h,
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(23.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23.r),
                child: Image.asset(
                  "assets/images/map.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            Text("Use My Current Location",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter",color: dark ? TColors.white :Colors.black),),
            SizedBox(height: 5.h,),
            TextFormField(
              style: TextStyle(fontSize: 20.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 15.w),
                  prefixIcon: Icon(Icons.location_on_outlined,color: TColors.primary,size: 26,),
                  suffixIcon: Icon(Icons.arrow_forward_ios,color: TColors.primary40,size: 20,),
                  hintText: "New cairo , Rehap",
                  hintStyle: TextStyle(fontFamily: "Inter",fontSize: 15.sp,color: TColors.primary40),
                  filled: true,
                  fillColor: dark ? Colors.white.withOpacity(0.2):Colors.white

              ),),
            SizedBox(height: 130.h,),
            Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r)
                      ),
                      backgroundColor: TColors.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 110.w,vertical: 10.h),

                    ),
                    onLongPress: (){},
                    onPressed: (){},
                    child: Text("Save Address",style: TextStyle(fontSize: 16.sp,fontFamily: "Inter"),))
            )
          ],
        )
        ,
      ),
    );
  }
}