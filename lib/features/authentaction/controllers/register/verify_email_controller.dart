// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flory/features/authentaction/controllers/register/verify_email_controller.dart';
// import 'package:flory/screens/RegisterScreens/success_screen.dart';
// import 'package:flory/utils/constants/images_string.dart';
// import 'package:flory/utils/constants/text_string.dart';
// import 'package:get/get.dart';
// import '../../../../common/widgets/loader/loader.dart';
// import '../../../../data/repositories/authentication/authentication_repository.dart';
// import 'dart:async';
//
// class VerifyEmailController extends GetxController {
// static VerifyEmailController get instance => Get.find();
//
// /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
// @override
// void onInit() {
//   sendEmailVerification();
//   setTimerForAutoRedirect();
//   super.onInit();
// }
// /// Send Email Verification link
// sendEmailVerification() async {
//   try {
//     await AuthenticationRepository.instance.sendEmailVerification();
//     TLoaders.successSnackBar (title: 'Email Sent', message: 'Please Check your inbox and verify your email.');
//   } catch (e) {
//     TLoaders.errorSnackBar (title: 'Oh Snap!', message: e.toString());
//   }
// }
// /// Timer to automatically redirect on Email Verification
// setTimerForAutoRedirect() {
//   Timer.periodic(
//       const Duration(seconds: 1),
//       (timer)async {
//        await FirebaseAuth.instance.currentUser?.reload();
//        final user = FirebaseAuth.instance.currentUser;
//        if(user?.emailVerified?? false){
//          timer.cancel();
//          Get.off(()=>SuccessScreen(
//              image: TImages.verifyDone,
//              tittle: TTexts.createdSuccessfully,
//              subTittle: TTexts.createdSuccessfullySubTittle,
//              onPressed:()=>AuthenticationRepository.instance.screenRedirect()),);
//        }
//   },);
// }
//
//   /// Manually Check if Email Verified
//    checkEmailVerificationStatus() async{
//   final currentUser = FirebaseAuth.instance.currentUser ;
//   if(currentUser!= null && currentUser.emailVerified){
//     Get.off(()=>SuccessScreen(
//         image: TImages.verifyDone,
//         tittle: TTexts.createdSuccessfully,
//         subTittle: TTexts.createdSuccessfullySubTittle,
//         onPressed:()=>AuthenticationRepository.instance.screenRedirect()),);
//   }
//    }
// }


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flory/utils/loader/loaders.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../screens/RegisterScreens/success_screen.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/text_string.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }
  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar (title: 'Email Sent', message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar (title: 'Oh Snap!', message: e.toString());
    }
  }
  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
          (timer)async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if(user?.emailVerified?? false){
          timer.cancel();
          Get.off(()=>SuccessScreen(
              image: TImages.verifyDone,
              tittle: TTexts.createdSuccessfully,
              subTittle: TTexts.createdSuccessfullySubTittle,
              onPressed:()=>AuthenticationRepository.instance.screenRedirect()),);
        }
      },);
  }

  /// Manually Check if Email Verified
  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser ;
    if(currentUser!= null && currentUser.emailVerified){
      Get.off(()=>SuccessScreen(
          image: TImages.verifyDone,
          tittle: TTexts.createdSuccessfully,
          subTittle: TTexts.createdSuccessfullySubTittle,
          onPressed:()=>AuthenticationRepository.instance.screenRedirect()),);
    }
  }
}




