import 'package:flory/data/repositories/user/user_repository.dart';
import 'package:flory/navigationItems/profile.dart';
import 'package:flory/utils/helpers/helper_functions.dart';
import 'package:flory/utils/http/http_client.dart';
import 'package:flory/utils/logging/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constants/images_string.dart';
import '../../../../utils/loader/loaders.dart';
import '../../../../utils/network/network_manager.dart';
import '../login/user_controller.dart';

class EditProfileController extends GetxController{
  static EditProfileController get instance =>Get.find();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumController = TextEditingController();
  var selectedGender = "".obs;
  final GlobalKey<FormState> EditFormKey = GlobalKey<FormState>();
  final userController = UserController.instance ;
  final userRepository = Get.put(UserRepository());


  //init user data
  @override
  void onInit() {
    initializeData();
    super.onInit();
  }
  //Fetch user record
  Future<void> initializeData ()async{
    fullNameController.text = userController.user.value.fullName ;
    emailController.text = userController.user.value.email ;
    phoneNumController.text= userController.user.value.phoneNumber ;
    selectedGender.value = userController.user.value.gender ;
  }
 Future<void> editUserData()async{
    try{
      //start loading
      THelperFunctions.openLoadDialog(
        'We are processing your information...',
        TImages.loaderAsset,
      );
      //check Internet connectivity
      // check the internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
      THelperFunctions.stopLoading();
        return;
      }
      //Form validation

      if(!EditFormKey.currentState!.validate()){
        THelperFunctions.stopLoading();
        return;
      }

      //update user's data in the Firebase Firestore
      Map<String , dynamic>userData = {'FullName':fullNameController.text.trim() ,'Email' :emailController.text.trim() ,
      'PhoneNumber':phoneNumController.text.trim() , 'Gender':selectedGender.value};
      await userRepository.updateSingleField(userData);


      //update RX user value
      userController.user.value.fullName = fullNameController.text.trim();
      userController.user.value.phoneNumber= phoneNumController.text.trim() ;
      //userController.user.value.email = emailController.text.trim();
      userController.user.value.gender = selectedGender.value;


      //Remove Loader
      THelperFunctions.stopLoading();

      //show success message
      TLoaders.successSnackBar(title: "Congratulations" ,message: "Your Data has been updated." );

      //Move to pre screen
      Get.off(()=>const Profile());

    }catch (e){
      THelperFunctions.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
 }


}