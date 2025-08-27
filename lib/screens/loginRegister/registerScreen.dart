//
// import 'package:flory/features/authentaction/controllers/register/register_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../../utils/constants/colors.dart';
// import '../../utils/constants/images_string.dart';
// import '../../utils/constants/text_string.dart';
// import '../../utils/validators/validation.dart';
// import 'SignInScreen.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
// class _RegisterScreenState extends State<RegisterScreen> {
// final controller = Get.put(RegisterController());
//   final _formKey = GlobalKey<FormState>();
//   bool _isPasswordHidden = true;
//
//   @override
//   void dispose() {
//     controller;
//     super.dispose();
//   }
//
//
//   Widget _buildTextFormField({
//     required TextEditingController controller,
//     required String hintText,
//     required IconData icon,
//     required String? Function(String?) validator,
//     bool obscureText = false,
//     Widget? suffixIcon,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: TColors.textFieldsColor,
//         borderRadius: BorderRadius.circular(12.r),
//       ),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         validator: validator,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle:  TextStyle(color:  TColors.blackF, fontSize: 16.sp),
//           prefixIcon: Icon(icon, color:  TColors.blackF),
//           suffixIcon: suffixIcon,
//           border: InputBorder.none,
//           errorBorder: InputBorder.none,
//           focusedErrorBorder: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 16.w,
//             vertical: 16.h,
//           ),
//           errorStyle:  TextStyle(
//             color: TColors.error,
//             fontSize: 12.sp,
//             height: 1.5.h,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: TColors.primaryBackground,
//       body: Stack(
//         children: [
//           //Image
//           Positioned(
//             top: 0.h,
//             left: 0.w,
//             child: Image.asset(TImages.flower, width: 267.w, height: 337.h),
//           ),
//           // title , subtitle
//           SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(30.r),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 320.h),
//
//                   Text(
//                     TTexts.title1,
//                     style:  TextStyle(
//                       fontSize: 30.0.sp,
//                       fontWeight: FontWeight.w300,
//                       color: TColors.black,
//                       fontFamily: "LibreBaskerville",
//                     ),
//                   ),
//
//                   SizedBox(height: 8.h),
//
//                   Text(
//                     TTexts.subTitle,
//                     style:  TextStyle(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w500,
//                       color: TColors.primary,
//                       fontFamily: "LibreBaskerville",
//                     ),
//                   ),
//
//                   SizedBox(height: 25.h),
//                   //Form
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 70.h,
//                           width: 349.w,
//                           child: _buildTextFormField(
//                             controller: controller.email,
//                             hintText: 'Email',
//                             icon: Icons.email_outlined,
//                             //   validator: _validateEmail,
//                             validator: TValidator.validateEmail,
//                           ),
//                         ),
//                         SizedBox(height: 15.h),
//                         SizedBox(
//                           height: 70.h,
//                           width: 349.w,
//                           child: _buildTextFormField(
//                             controller: controller.username,
//                             hintText: 'Username',
//                             icon: Icons.person_outline,
//                             validator: TValidator.validateUsername,
//                           ),
//                         ),
//                         SizedBox(height: 15.h),
//                         SizedBox(
//                           height: 70.h,
//                           width: 349.w,
//                           child: _buildTextFormField(
//                             controller: controller.password,
//                             hintText: 'Password',
//                             icon: Icons.lock_outline,
//                             //  validator: _validatePassword,
//                             validator: TValidator.validatePassword,
//
//                             obscureText: _isPasswordHidden,
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _isPasswordHidden
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: const Color(0xFF666666),
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _isPasswordHidden = !_isPasswordHidden;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20.h),
//                         //confirm msg
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               TTexts.confirm_msg,
//                               style: TextStyle(
//                                 fontSize: 14.0.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: TColors.primary,
//                                 fontFamily: "LibreBaskerville",
//                               ),
//                             ),
//                             SizedBox(width: 16.w),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => SignInScreen(),
//                                   ),
//                                 );
//                               },
//                               child:  Text(
//                                 'Sign In',
//                                 style: TextStyle(
//                                   fontSize: 14.0.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: TColors.black,
//                                   fontFamily: "LibreBaskerville",
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         //Register Btn
//                         SizedBox(height: 30.h),
//                         SizedBox(
//                           height: 70.h,
//                           width: 349.w,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) =>  HomeScreen(),
//                                 //   ),
//                                 // );
//                                 controller.register();
//                               } else {
//                                 // check each field individually to identify where the problem is
//                                 String? emailError = TValidator.validateEmail(
//                                   controller.email.text,
//                                 );
//                                 String? usernameError =
//                                 TValidator.validateUsername(
//                                   controller.username.text,
//                                 );
//                                 String? passwordError =
//                                 TValidator.validatePassword(
//                                   controller.password.text,
//                                 );
//
//                                 String firstErrorMessage =
//                                     emailError ??
//                                         usernameError ??
//                                         passwordError ??
//                                         'Please check the form';
//                               }
//                             },
//
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: TColors.buttonPrimary,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12.r),
//                               ),
//                               elevation: 0,
//                             ),
//                             child:  Text(
//                               'Register',
//                               style: TextStyle(
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: TColors.primaryBackground,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flory/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../navigationItems/homeScreen.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/images_string.dart';
import '../../utils/constants/text_string.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/validators/validation.dart';
import '../../widgets/divider_social_login.dart';
import '../../widgets/login_text_fields.dart';
import 'SignInScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? TColors.blackF : TColors.primaryBackground,
      body: Stack(
        children: [
          //Image
          Positioned(
            top: 0.h,
            left: 0.w,
            child: Image.asset(TImages.flower, width: 267.w, height: 337.h),
          ),
          // title , subtitle
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 290.h),

                  Text(
                    TTexts.title1,
                    style:  TextStyle(
                      fontSize: 30.0.sp,
                      fontWeight: FontWeight.w300,
                      color: dark ? TColors.white : TColors.black,
                      fontFamily: "LibreBaskerville",
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    TTexts.subTitle,
                    style:  TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: TColors.primary,
                      fontFamily: "LibreBaskerville",
                    ),
                  ),

                  SizedBox(height: TSizes.spaceBtwSections.h),
                  //Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70.h,
                          width: 349.w,
                          child: LoginTextFields(
                            controller: _emailController,
                            hintText: 'Email',
                            icon: CupertinoIcons.mail,
                            validator: TValidator.validateEmail,
                          ),
                        ),
                        SizedBox(height: TSizes.spaceBtwInputFields.h),
                        SizedBox(
                          height: 70.h,
                          width: 349.w,
                          child: LoginTextFields(
                            controller: _usernameController,
                            hintText: 'Username',
                            icon: CupertinoIcons.person,
                            validator: TValidator.validateUsername,
                          ),
                        ),
                        SizedBox(height: TSizes.spaceBtwInputFields.h),
                        SizedBox(
                          height: 70.h,
                          width: 349.w,
                          child:LoginTextFields(
                            controller: _passwordController,
                            hintText: 'Password',
                            icon: CupertinoIcons.lock,
                            //  validator: _validatePassword,
                            validator: TValidator.validatePassword,

                            obscureText: _isPasswordHidden,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xFF666666),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordHidden = !_isPasswordHidden;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: TSizes.spaceBtwInputFields.h),
                        //confirm msg
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              TTexts.confirm_msg,
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w500,
                                color: TColors.primary,
                                fontFamily: "LibreBaskerville",
                              ),
                            ),
                            SizedBox(width: 16.w),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              },
                              child:  Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                  color: dark ?TColors.white : TColors.black,
                                  fontFamily: "LibreBaskerville",
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Register Btn
                        SizedBox(height:TSizes.spaceBtwItems.h),
                        SizedBox(
                          height: 70.h,
                          width: 349.w,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  HomeScreen(),
                                  ),
                                );
                              } else {
                                // check each field individually to identify where the problem is
                                String? emailError = TValidator.validateEmail(
                                  _emailController.text,
                                );
                                String? usernameError =
                                TValidator.validateUsername(
                                  _usernameController.text,
                                );
                                String? passwordError =
                                TValidator.validatePassword(
                                  _passwordController.text,
                                );

                                String firstErrorMessage =
                                    emailError ??
                                        usernameError ??
                                        passwordError ??
                                        'Please check the form';
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.buttonPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              elevation: 0,
                            ),
                            child:  Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: TColors.primaryBackground,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,),
                  DividerSocialLogin(divierText: 'Or Sign up with')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


