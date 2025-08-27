
import 'package:flory/screens/onBoarding/onBoarding.dart';
import 'package:flory/screens/onBoarding/welcomScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  /// Function to Show Relevant Screen
  screenRedirect() async {
    // Local Storage
    if(kDebugMode){
      print("==================Get Storage Auth Repo===================");
      print(deviceStorage.read('IsFirstTime'));
    }
  deviceStorage.writeIfNull('IsFirstTime',true);
  deviceStorage.read('IsFirstTime')!= true ? Get.offAll(()=> const Welcomescreen()):Get .offAll(const OnBoarding()) ;
  }
}