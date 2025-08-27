//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../common/widgets/loader/animation_loader.dart';
// import '../../navigationItems/navigation_menu.dart' as TColors;
// import '../helpers/helper_functions.dart';
// class TFullScreenLoader {
//
//
//   static void openLoadingDialog(String text, String animation) {
//     showDialog(
//       context: Get.overlayContext!,
//       // Use Get.overlayContext for overlay dialogs
//       barrierDismissible: false,
//       // The dialog can't be dismissed by tapping outside it
//       builder: (_) =>
//           PopScope(
//             canPop: false, // Disable popping with the back button
//             child: Container(
// // color: THelperFunctions.isDarkMode (Get.context!) ? TColors.dark:  ,
//               color: Colors.white,
//               width: double.infinity,
//               height: double.infinity,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 250,), // Adjust the spacing as needed
//                   TAnimationLoaderWidget(text: text, animation: animation),
//                 ],
//               ), // Column
//             ),
//           ), // Container
//     );
//   }
//   static void stopLoading(){
//     Navigator.of(Get.overlayContext!).pop();
//   }
// }