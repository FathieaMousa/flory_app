
import 'package:flory/bindings/general_bindings.dart';
import 'package:flory/screens/onBoarding/onBoarding.dart';
import 'package:flory/utils/constants/colors.dart';
import 'package:flory/utils/theme/theme.dart';
import 'package:flory/utils/theme/theme_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
//
//     return ScreenUtilInit(
//         designSize: Size(412, 917),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         child:GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             themeMode: ThemeMode.system,
//             theme: TAppTheme.LightTheme,
//             darkTheme: TAppTheme.DarkTheme,
//             home: const OnBoarding()
//         )  );
//
//
//   }
// }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeManager.themeNotifier,
        builder: (context, themeMode, child) {
          print('الوضع الحالي: $themeMode');
          return ScreenUtilInit(
              designSize: Size(412, 917),
              minTextAdapt: true,
              splitScreenMode: true,
              child:GetMaterialApp(
                debugShowCheckedModeBanner: false,
                theme: TAppTheme.LightTheme,
                darkTheme: TAppTheme.DarkTheme,
                themeMode:themeMode,
               initialBinding: GeneralBindings(),

               // home: const OnBoarding(),
                home:const Scaffold(backgroundColor: TColors.primary,body: Center(child:CircularProgressIndicator(color: TColors.primaryBackground,)),)

              )
          );
        }
    );


  }
}