import 'package:flory/common/widgets/loader/loader.dart';
import 'package:flory/data/repositories/authentication/authentication_repository.dart';
import 'package:flory/data/repositories/user/user_repository.dart';
import 'package:flory/features/authentaction/models/user_model.dart';
import 'package:flory/screens/RegisterScreens/verify_email.dart';
import 'package:flory/utils/constants/images_string.dart';
import 'package:flory/utils/popup/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loader/network.dart';

class RegisterController extends GetxController{
  static RegisterController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final hidePassword = true.obs;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();


   void register() async{
    try {
      //start Loader
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information......', TImages.docerAnimation);

      //check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form validation
      if (!registerFormKey.currentState!.validate()) return;


// Privacy Policy Check
//     if (!privacyPolicy.value) {
//     TLoaders.warningSnackBar(
//     title: 'Accept Privacy Policy',
//     message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
//     );
//     return;
//     }


    //Register user in Firebase Auth  & save user data  in the firebase

     final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

    // save Auth user data in the Firebase FireStore
  final newUser = UserModel(
    id:userCredential.user!.uid ,
    firstName: firstName.text.trim(),
    lastName: lastName.text.trim(),
    username:username.text.trim(),
    email: email.text.trim(),
    phoneNumber: phoneNumber.text.trim(),
    profilePicture: ' ',

  );
   final userRepository =Get.put(UserRepository());
   userRepository.saveUserRecord(newUser);


// Show Success.Message
     TLoaders.successSnackBar (title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');
      // move to Verify Email Screen
      Get.to(()=>const VerifyEmail());
    }catch(e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      //Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

}