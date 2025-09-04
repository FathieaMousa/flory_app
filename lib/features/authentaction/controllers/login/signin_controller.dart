import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loader/loader.dart';
import '../../../../common/widgets/loader/network.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/popup/full_screen_loader.dart';

class SigninController extends GetxController {
/// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text=localStorage.read('REMEMBER_ME_EMAIL'); // لو عملت تسجيل خروج تبقى البيانات محفوظة
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  /// Email and Password SignIn
  Future<void>EmailAndPasswordSignIn () async {
    try {
      //start Loader
      TFullScreenLoader.openLoadingDialog('Logging you in......', TImages.docerAnimation);

      //check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form validation
      if (!signinFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //save data if Remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }


      //SignIn user using Email & Password Auth

      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //  Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
      }catch(e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      //Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      }
    }
  }
