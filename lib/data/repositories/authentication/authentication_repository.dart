//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flory/screens/LoginScreens/SignInScreen.dart';
// import 'package:flory/screens/RegisterScreens/verify_email.dart';
// import 'package:flory/screens/onBoarding/onBoarding.dart';
// import 'package:flory/screens/onBoarding/welcomScreen.dart';
// import 'package:flory/widgets/navigation_menu.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../../../utils/exception/firebase_auth_exceptions.dart';
// import '../../../utils/exception/firebase_exceptions.dart';
// import '../../../utils/exception/format_exceptions.dart';
// import '../../../utils/exception/platform_exceptions.dart';
// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();
//
//   /// Variables
//   final deviceStorage = GetStorage();
//   final _auth = FirebaseAuth.instance;
//
//   /// Called from main.dart on app launch
//   @override
//   void onReady() {
//     // Remove to native splash screen
//     FlutterNativeSplash.remove();
//     // Redirect to the appropriate screen
//     screenRedirect();
//   }
//
//
//   /// Function to Show Relevant Screen
//   screenRedirect() async {
//     final user = _auth.currentUser ;
//     if(user != null){
//       // if the user is logged in
//       if(user.emailVerified){
//         //if the user's email is verified  , navigate to the main Navigation Menu
//         Get.offAll(()=>const NavigationMenu());
//       }else{
//         //if the user's email is not verified  , navigate to the Verification email screen
//
//         Get.offAll(()=> VerifyEmail(email:_auth.currentUser?.email));
//       }
//     }else{
//       // Local Storage
//
//       // if (kDebugMode) {
//       //   print("==================Get Storage Auth Repo===================");
//       //   print(deviceStorage.read('IsFirstTime'));
//       // }
//       deviceStorage.writeIfNull('IsFirstTime', true);
//       //check if it's the first time launching the app
//       deviceStorage.read('IsFirstTime') != true
//           ? Get.offAll(() => const Welcomescreen()) //Redirect  to welcome screen if not the first time
//           : Get.offAll(const OnBoarding());  //Redirect  to onBoarding screen if it's the first time
//     }
//
//
//   }
//   /* -------------------------------- Email & Password sign_in ------------------------------------- */
//
//   ///Email Authentication  SignIn
//    Future<UserCredential> loginWithEmailAndPassword(String email , String password)async{
//   try{
//     return await _auth.signInWithEmailAndPassword(email: email, password: password);
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw const TFormatException();
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw 'Something went wrong. Please try again';
//   }
//   }
//
//
//   /// Email Authentication - REGISTER
//   Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
//     try {
//       return await _auth.createUserWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again';
//     }
//   }
//
//
//   /// [EmailVerification] - MAIL VERIFICATION
//   Future<void> sendEmailVerification() async {
//     try {
//       await _auth.currentUser?.sendEmailVerification();
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again';
//     }
//   }
//
//   /// Logout User (Valid for any authentication)
//    Future<void> logout() async{
//   try{
//    await FirebaseAuth.instance.signOut();
//    Get.offAll(()=> const SignInScreen());
//   } on FirebaseAuthException catch (e) {
//   throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//   throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//   throw const TFormatException();
//   } on PlatformException catch (e) {
//   throw TPlatformException(e.code).message;
//   } catch (e) {
//   throw 'Something went wrong. Please try again';
//   }
//   }
//
//   /// Forget Password
//   Future<void> sendPasswordResetEmail(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again';
//     }
//   }
//
// }
//

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flory/screens/RegisterScreens/verify_email.dart';
import 'package:flory/screens/onBoarding/onBoarding.dart';
import 'package:flory/widgets/navigation_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../screens/onBoarding/welcomScreen.dart';
import '../../../utils/exception/firebase_auth_exceptions.dart';
import '../../../utils/exception/firebase_exceptions.dart';
import '../../../utils/exception/format_exceptions.dart';
import '../../../utils/exception/platform_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart' ;

import '../user/user_repository.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// called from main on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async{
    final user = _auth.currentUser;

    if(user != null){
      // if user is logged in
      if(user.emailVerified){
        // if user's email is verified, navigate to the navigation menu.
        Get.offAll(()=>NavigationMenu());
      }else{
        // if user's email is not verified, navigate to the verify screen
        Get.offAll(()=>VerifyEmail(email: _auth.currentUser?.email,));
      }
    } else{
      //local Storage
      if(kDebugMode){
        print('------------- Get Storage Auth Repository -----------------');
        print(deviceStorage.read('IsFirstTime'));
      }

      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime')!= true ?
      Get.offAll(()=>const Welcomescreen()):
      Get.offAll(const OnBoarding());
    // } else {
    //   // أول مرة يفتح التطبيق → أظهر OnBoarding أو Splash
    //   if (deviceStorage.read('IsFirstTime') != true) {
    //     Get.offAll(() => const OnBoarding());
    //   } else {
    //     // إذا شاف OnBoarding قبل → يروح مباشرة لـ WelcomeScreen
    //     Get.offAll(() => const Welcomescreen());
    //   }
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
  // Email Authentication - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email , String password)async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }

  }





  /// [ReAuthenticate] RE AUTHENTICATE USER
  Future<void> reAuthenticateEmailAndPassword(String email, String password) async {
    try {
// Create a credential
      AuthCredential credential = EmailAuthProvider.credential (email: email, password: password);
// ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential (credential);
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
  // Google sign in ----
  Future<UserCredential> signInWithGoogle()async{
    try{
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      // obtain the auth details from the request.
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
      // create anew  credentials
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      // once signed in return  the user credentials.
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw '❌ FirebaseAuthException code=${e.code} message=${e.message}';
    } on FormatException catch (_){
      throw TFormatException();
    } on PlatformException catch (e){
      throw '❌ PlatformException code=${e.code} message=${e.message} details=${e.details}';
    } catch (e){
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

  // logout user
  Future <void> logout() async{
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=>const Welcomescreen());
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong please try again';
    }
  }

/// DELETE USER Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch(e){
  throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e){
  throw TFirebaseException(e.code).message;
  } on FormatException catch (_){
  throw TFormatException();
  } on PlatformException catch (e){
  throw TPlatformException(e.code).message;
  } catch(e){
  throw 'Something went wrong please try again';
  }


}
}




