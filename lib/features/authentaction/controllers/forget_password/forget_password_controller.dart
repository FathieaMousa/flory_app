// import 'package:flory/data/repositories/authentication/authentication_repository.dart';
// import 'package:flory/screens/LoginScreens/password_configuration/reset_password.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import '../../../../utils/constants/images_string.dart';
// import '../../../../utils/loader/loaders.dart';
// import '../../../../utils/network/network_manager.dart';
// import '../../../../utils/popup/full_screen_loader.dart';
//
// class ForgetPasswordController extends GetxController {
//   static ForgetPasswordController get instance => Get.find();
//
//
//   ///variables
//   final email = TextEditingController();
//   GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
//
// ///send Reset Password Email
//   sendResetPasswordEmail() async{
//     try{
//       //start Loader
//       TFullScreenLoader.openLoadingDialog('Processing your request......', TImages.docerAnimation);
//       //check Internet connectivity
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//       // Form validation
//       if (!forgetPasswordFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//
//       await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
//
//       //  Remove Loader
//       TFullScreenLoader.stopLoading();
//
//       // Show Success.Message
//       TLoaders.successSnackBar (title: 'Email sent', message: 'Email Link Sent to Reset your Password.'.tr);
//
//       //Redirect
//       Get.to(()=> ResetPassword(email : email.text.trim()));
//     }catch(e){
//       //  Remove Loader
//       TFullScreenLoader.stopLoading();
//       //Show some Generic Error to the user
//       TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
//     }
//   }
//
//   resendResetPasswordEmail(String email) async{
//     try{
//       //start Loader
//       TFullScreenLoader.openLoadingDialog('Processing your request......', TImages.docerAnimation);
//       //check Internet connectivity
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {TFullScreenLoader.stopLoading();return;}
//
//     //send Email to reset Password
//       await AuthenticationRepository.instance.sendPasswordResetEmail(email);
//
//       //  Remove Loader
//       TFullScreenLoader.stopLoading();
//
//       // Show Success.Message
//       TLoaders.successSnackBar (title: 'Email sent', message: 'Email Link Sent to Reset your Password.'.tr);
//
//     }catch(e){
//       //  Remove Loader
//       TFullScreenLoader.stopLoading();
//       //Show some Generic Error to the user
//       TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
//     }
//   }
// }
import 'package:flory/screens/LoginScreens/password_configuration/reset_password.dart';
import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/loader/loaders.dart';
import '../../../../utils/network/network_manager.dart';


class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///send Reset Password Email
  sendResetPasswordEmail() async{
    try{
      //start Loader
      THelperFunctions.openLoadDialog('Processing your request......', TImages.loaderAsset);
      //check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        THelperFunctions.stopLoading();
        return;
      }
      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        THelperFunctions.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //  Remove Loader
      THelperFunctions.stopLoading();

      // Show Success.Message
      TLoaders.successSnackBar (title: 'Email sent', message: 'Email Link Sent to Reset your Password.'.tr);

      //Redirect
      Get.to(()=> ResetPassword(email: email.text.trim(),));
    }catch(e){
      //  Remove Loader
      THelperFunctions.stopLoading();
      //Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  resendResetPasswordEmail(String email) async{
    try{
      //start Loader
      THelperFunctions.openLoadDialog('Processing your request......', TImages.loaderAsset);
      //check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {THelperFunctions.stopLoading();return;}

      //send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //  Remove Loader
      THelperFunctions.stopLoading();

      // Show Success.Message
      TLoaders.successSnackBar (title: 'Email sent', message: 'Email Link Sent to Reset your Password.'.tr);

    }catch(e){
      //  Remove Loader
      THelperFunctions.stopLoading();
      //Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}