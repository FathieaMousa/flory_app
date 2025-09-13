// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../../../../data/repositories/authentication/authentication_repository.dart';
// import '../../../../utils/constants/images_string.dart';
// import '../../../../utils/loader/loaders.dart';
// import '../../../../utils/network/network_manager.dart';
// import '../../../../utils/popup/full_screen_loader.dart';
//
// class SigninController extends GetxController {
// /// variables
//   final rememberMe = false.obs;
//   final hidePassword = true.obs;
//   final localStorage = GetStorage();
//   final email = TextEditingController();
//   final password = TextEditingController();
//   GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
//
//
//   @override
//   void onInit() {
//     email.text=localStorage.read('REMEMBER_ME_EMAIL'); // لو عملت تسجيل خروج تبقى البيانات محفوظة
//     password.text = localStorage.read('REMEMBER_ME_PASSWORD');
//     super.onInit();
//   }
//
//   /// Email and Password SignIn
//   Future<void>EmailAndPasswordSignIn () async {
//     try {
//       //start Loader
//       TFullScreenLoader.openLoadingDialog('Logging you in......', TImages.docerAnimation);
//
//       //check Internet connectivity
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//       // Form validation
//       if (!signinFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//
//       //save data if Remember me is selected
//       if (rememberMe.value) {
//         localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
//         localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
//       }
//
//
//       //SignIn user using Email & Password Auth
//
//       final userCredentials = await AuthenticationRepository.instance
//           .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
//
//       //  Remove Loader
//       TFullScreenLoader.stopLoading();
//
//       // Redirect
//       AuthenticationRepository.instance.screenRedirect();
//       }catch(e) {
//       //Remove Loader
//       TFullScreenLoader.stopLoading();
//       //Show some Generic Error to the user
//       TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
//       }
//     }
//   }

import 'package:flory/features/authentaction/controllers/login/user_controller.dart';
import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flory/utils/loader/loaders.dart';
import 'package:flory/utils/network/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_string.dart';

class SigninController extends GetxController{
  static SigninController get instance => Get.find();

  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // emailController.text = localStorage.read('REMEMBER_ME_EMAIL');
    //passwordController.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }
  // Email and password sign in
  Future<void>emailAndPasswordSignIn () async {
    try {
      //start Loader
      THelperFunctions.openLoadDialog('Logging you in......', TImages.loaderAsset);

      //check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        THelperFunctions.stopLoading();
        return;
      }
      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        THelperFunctions.stopLoading();
        return;
      }

      //save data if Remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', emailController.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', passwordController.text.trim());
      }


      //SignIn user using Email & Password Auth

      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());

      //  Remove Loader
      THelperFunctions.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    }catch(e) {
      //Remove Loader
      THelperFunctions.stopLoading();
      //Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

// Google sign in authentication
  Future<void> googleSignIn() async {
    try{
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TLoaders.errorSnackBar(title: 'No Internet Connection' , message: 'Please check your connection and try again later.');
        return;
      }
      THelperFunctions.openLoadDialog('Logging you in...', TImages.loaderAsset);
      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // save user records
      await userController.saveUserRecord(userCredentials);
      // remove loader
      THelperFunctions.stopLoading();
      // redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e){
      THelperFunctions.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}