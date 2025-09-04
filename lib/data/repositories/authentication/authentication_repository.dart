
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flory/screens/LoginScreens/SignInScreen.dart';
import 'package:flory/screens/RegisterScreens/verify_email.dart';
import 'package:flory/screens/onBoarding/onBoarding.dart';
import 'package:flory/screens/onBoarding/welcomScreen.dart';
import 'package:flory/widgets/navigation_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/exception/firebase_auth_exceptions.dart';
import '../../../utils/exception/firebase_exceptions.dart';
import '../../../utils/exception/format_exceptions.dart';
import '../../../utils/exception/platform_exceptions.dart';
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // Remove to native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }


  /// Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser ;
    if(user != null){
      // if the user is logged in
      if(user.emailVerified){
        //if the user's email is verified  , navigate to the main Navigation Menu
        Get.offAll(()=>const NavigationMenu());
      }else{
        //if the user's email is not verified  , navigate to the Verification email screen

        Get.offAll(()=> VerifyEmail(email:_auth.currentUser?.email));
      }
    }else{
      // Local Storage

      // if (kDebugMode) {
      //   print("==================Get Storage Auth Repo===================");
      //   print(deviceStorage.read('IsFirstTime'));
      // }
      deviceStorage.writeIfNull('IsFirstTime', true);
      //check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const Welcomescreen()) //Redirect  to welcome screen if not the first time
          : Get.offAll(const OnBoarding());  //Redirect  to onBoarding screen if it's the first time
    }


  }
  /* -------------------------------- Email & Password sign_in ------------------------------------- */

  ///Email Authentication  SignIn
   Future<UserCredential> loginWithEmailAndPassword(String email , String password)async{
  try{
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
  }


  /// Email Authentication - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Logout User (Valid for any authentication)
   Future<void> logout() async{
  try{
   await FirebaseAuth.instance.signOut();
   Get.offAll(()=> const SignInScreen());
  } on FirebaseAuthException catch (e) {
  throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
  throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
  throw const TFormatException();
  } on PlatformException catch (e) {
  throw TPlatformException(e.code).message;
  } catch (e) {
  throw 'Something went wrong. Please try again';
  }
  }

  /// Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}



