import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instaapp/constant/color.dart';
import 'package:instaapp/controller/authController.dart';
import 'package:instaapp/controller/local_controller.dart';
import 'package:instaapp/view/widget/CustomTextForm.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:instaapp/view/screen/register.dart';
import 'package:instaapp/view/widget/MyBottomNavBar.dart';

class LoginPage extends StatefulWidget {
  final bool? isDarkMode;
  final Function? toggleTheme;

  const LoginPage({super.key, this.isDarkMode, this.toggleTheme});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final MyLocalController localControllerLang = Get.find<MyLocalController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  bool isObsecure=true;
  void togglePasswordVisibility(){
    setState(() {
      isObsecure=!isObsecure;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Container(
                  alignment: Alignment.topRight,
                  child:
                  IconButton(
                    onPressed: () {
                      Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                    },
                    icon: Icon(
                      Get.isDarkMode ? Icons.color_lens : Icons.color_lens,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Obx(() {
                    String currentLanguage = localControllerLang.initLang?.value.languageCode ?? 'en';
                    return PopupMenuButton<String>(
                      icon: Icon(
                        Icons.language,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      onSelected: (String selectLanguage) {
                        localControllerLang.changeLang(selectLanguage);
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<String>(
                          child: Text(
                            "English",
                            style: TextStyle(
                              fontWeight: currentLanguage == "en" ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          value: "en",
                        ),
                        PopupMenuItem(
                          child: Text(
                            "Arabic",
                            style: TextStyle(
                              fontWeight: currentLanguage == "ar" ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          value: "ar",
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 30.h),
                Text(
                  "Instagram",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Satisfy',
                  ),
                ),

                // Image.asset(
                //   Get.isDarkMode ?
                //   'assets/images/insta.png' :
                //   'assets/images/insta2.png',
                //   height: 68.h,
                //   width: 244.w,
                // ),
                SizedBox(height: 50.h), // Add space before the text fields
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20.w,
                  child: CustomTextForm(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "1".tr,
                    funcValidator: (value) {
                      if (value == "") {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                    iconData: Icons.email,
                  ),
                ),
                SizedBox(height: 20.h), // Spacing between the fields
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20.w,
                  child: CustomTextForm(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "2".tr,
                    changeVisibality: togglePasswordVisibility,
                    funcValidator: (value) {
                      if (value == "") {
                        return 'please enter valid password';
                      }
                      return null;
                    },
                    isPassword: true,
                    isObsecure: isObsecure,
                  ),
                ),
                SizedBox(height: 30.h), // Spacing before the button
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: MyColor.Myblue,
                    ),
                    onPressed: () async {
                      if (formState.currentState?.validate() ?? false) {
                        authController.isLoading.value = true;
                        try {
                          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          // Successful login
                          Get.off(MyBottomNavBar());
                        } on FirebaseAuthException catch (e) {
                          String title = 'Error';
                          String desc = '';

                          switch (e.code) {
                            case 'user-not-found':
                              title = 'User Not Found';
                              desc = 'No user found for this email.';
                              break;
                            case 'wrong-password':
                              title = 'Incorrect Password';
                              desc = 'The password entered is incorrect.';
                              break;
                            case 'invalid-email':
                              title = 'Invalid Email';
                              desc = 'The email address is malformed.';
                              break;
                            case 'operation-not-allowed':
                              title = 'Operation Not Allowed';
                              desc = 'Email/Password sign-in is not enabled.';
                              break;
                            case 'user-disabled':
                              title = 'User Disabled';
                              desc = 'The user account has been disabled.';
                              break;
                            default:
                              desc = e.message ?? 'An unknown error occurred.';
                              break;
                          }

                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: title,
                            desc: desc,
                          )..show();
                        } catch (e) {
                          print('Sign in failed: $e');
                        } finally {
                          authController.isLoading.value = false;
                        }
                      } else {
                        print("Form validation failed");
                      }
                    }

                    // onPressed: () async {
                    //   if (formState.currentState?.validate() ?? false) {
                    //     authController.isLoading.value = true;
                    //     try {
                    //       await FirebaseAuth.instance.signInWithEmailAndPassword(
                    //         email: emailController.text,
                    //         password: passwordController.text,
                    //       );
                    //       Get.off( MyBottomNavBar());
                    //     } on FirebaseAuthException catch (e) {
                    //       String title = '';
                    //       String desc = '';
                    //
                    //       if (e.code == 'user-not-found') {
                    //         title = 'User Not Found';
                    //         desc = 'No user found for this email.';
                    //       } else if (e.code == 'wrong-password') {
                    //         title = 'Incorrect Password';
                    //         desc = 'The password entered is incorrect.';
                    //       }
                    //
                    //       if (title.isNotEmpty) {
                    //         AwesomeDialog(
                    //           context: context,
                    //           dialogType: DialogType.error,
                    //           animType: AnimType.rightSlide,
                    //           title: title,
                    //           desc: desc,
                    //         )..show();
                    //       }
                    //     } catch (e) {
                    //       print('Non-FirebaseAuthException error: $e');
                    //     } finally {
                    //       authController.isLoading.value = false;
                    //     }
                    //   } else {
                    //     print("Form validation failed");
                    //   }
                    // },
                    ,child: Text(
                      "3".tr,
                      style: TextStyle(
                        color: MyColor.MyWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h), // Spacing before the register link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do not have an email?"),
                    InkWell(
                      onTap: () {
                        Get.to(RegisterPage());
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:instaapp/constant/color.dart';
// import 'package:instaapp/controller/authController.dart';
// import 'package:instaapp/controller/local_controller.dart';
// import 'package:instaapp/view/screen/MyBottomNavBar.dart';
// import 'package:instaapp/view/screen/profileedit.dart';
// import 'package:instaapp/view/widget/CustomTextForm.dart';
// import 'package:get/get.dart';
// import 'package:instaapp/view/screen/register.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
//
// class LoginPage extends StatefulWidget {
//   final bool? isDarkMode;
//   final Function? toggleTheme;
//
//   const LoginPage({super.key, this.isDarkMode, this.toggleTheme});
//
//   @override
//   State<LoginPage> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<LoginPage> {
//   MyLocalController localControllerLang = Get.find<MyLocalController>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isDarkMode = true;
//   GlobalKey<FormState> formState = GlobalKey<FormState>();
//   final AuthController authController = Get.put(AuthController());
//
//
//   //
//   // void toggleTheme() {
//   //   setState(() {
//   //     isDarkMode != isDarkMode;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Form(
//           key: formState,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: 20.h),
//                 Container(
//                   alignment: Alignment.topRight,
//                   child: IconButton(
//                     onPressed: () {
//                       Get.changeTheme(Get.isDarkMode?ThemeData.light():ThemeData.dark());
//
//                       // if (Get.isDarkMode) {
//                       //   Get.changeTheme(ThemeData.light());
//                       // } else {
//                       //   Get.changeTheme(ThemeData.dark());
//                       // }
//                     },
//                     icon: Icon(
//                       Get.isDarkMode ? Icons.color_lens : Icons.color_lens,
//                       color: Get.isDarkMode ? Colors.white : Colors.black,
//                     ),
//                   ),
//                 ),
//                 Container(
//                     alignment: Alignment.topRight,
//                     child: Obx(() {
//                       String currentLanguage =
//                           localControllerLang.initLang?.value.languageCode ??
//                               'en';
//                       return PopupMenuButton<String>(
//                         icon: Icon(
//                           Icons.language,
//                           color: Get.isDarkMode ? Colors.white : Colors.black,
//                         ),
//                         onSelected: (String selectLanguage) {
//                           localControllerLang.changeLang(selectLanguage);
//                         },
//                         itemBuilder: (BuildContext context) => [
//                           PopupMenuItem<String>(
//                             child: Text(
//                               "English",
//                               style: TextStyle(
//                                 fontWeight: currentLanguage == "en"
//                                     ? FontWeight.bold
//                                     : FontWeight.normal,
//                               ),
//                             ),
//                             value: "en",
//                           ),
//                           PopupMenuItem(
//                             child: Text("Arabic",
//                                 style: TextStyle(
//                                     fontWeight: currentLanguage == "ar"
//                                         ? FontWeight.bold
//                                         : FontWeight.normal)),
//                             value: "ar",
//                           )
//                         ],
//                       );
//                     }
//                         //     IconButton(
//                         //   onPressed: () {
//                         //     if (localControllerLang.initLang?.value.languageCode == "en") {
//                         //       localControllerLang.changeLang("ar");
//                         //     } else {
//                         //       localControllerLang.changeLang("en");
//                         //     }
//                         //   },
//                         //   icon: Icon(
//                         //         localControllerLang.initLang?.value.languageCode == "en"
//                         //         ? Icons.language
//                         //         : Icons.translate,
//                         //     color: Get.isDarkMode ? Colors.white : Colors.black,
//                         //   ),
//                         // ),
//                         )),
//                 Stack(
//                     children: [
//                       Positioned(
//                         top: 150.h,
//                         left: 55.h,
//                         child: Get.isDarkMode
//                             ? Image.asset(
//                                 'assets/images/insta.png',
//                                 height: 68.h,
//                                 width: 244.w,
//                               )
//                             : Image.asset('assets/images/insta2.png',
//                                 height: 68.h, width: 244.w),
//                       ),
//                       Positioned(
//                           left: 10.h,
//                           right: 10.h,
//                           top: 250.h,
//                           child: SizedBox(
//                             width: MediaQuery.of(context).size.width - 20.w,
//                             height: 50.h,
//                             child: CustomTextForm(
//                               controller: emailController,
//                               keyboardType: TextInputType.emailAddress,
//                               hintText: "1".tr,
//                               funcValidator: (value) {
//                                 if (value=="") {
//                                   return 'please enter valid email';
//                                 }
//                                 return null;
//                               },
//                               iconData: Icons.email,
//                             ),
//                           )),
//                       Positioned(
//                           left: 10.h,
//                           right: 10.h,
//                           top: 320.h,
//                           child: SizedBox(
//                             width: MediaQuery.of(context).size.width - 20.w,
//                             height: 50.h,
//                             child: CustomTextForm(
//                               controller: passwordController,
//                               keyboardType: TextInputType.visiblePassword,
//                               hintText: "2".tr,
//                               funcValidator: (value) {
//                                 if (value=="") {
//                                   return 'please enter valid password';
//                                 }
//                                 return null;
//                               },
//                               isPassword: true,
//                               isObsecure: true,
//                               iconData: Icons.lock,
//                             ),
//                           )),
//                       Positioned(
//                         left: 10.h,
//                         right: 10.h,
//                         top: 400.h,
//                         child: SizedBox(
//                           width: 400.h,
//                           height: 50.h,
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10)),
//                                   backgroundColor: MyColor.Myblue),
//                               onPressed: () async {
//                                 if (formState.currentState?.validate()??false) {
//                                   authController.isLoading.value=true;
//                                   try {
//                                     final credential = await FirebaseAuth.instance
//                                         .signInWithEmailAndPassword(
//                                       email: emailController.text,
//                                       password: passwordController.text,
//                                     );
//                                     Get.off(const HomePage());
//                                   } on FirebaseAuthException catch (e) {
//                                     if (e.code == 'user-not-found') {
//                                       print('The password provided is too weak.');
//                                       AwesomeDialog(
//                                         context: context,
//                                         dialogType: DialogType.error,
//                                         animType: AnimType.rightSlide,
//                                         title: 'User Not Found',
//                                         desc: 'No user found for this email.',
//                                       )..show();
//                                     } else if (e.code == 'wrong-password') {
//                                       print(
//                                           'The account already exists for that email.');
//                                       AwesomeDialog(
//                                         context: context,
//                                         dialogType: DialogType.error,
//                                         animType: AnimType.rightSlide,
//                                         title: 'Incorrect Password',
//                                         desc: 'The password entered is incorrect.',
//                                       )..show();
//                                     }
//
//                                   } catch (e) {
//                                     print(e);
//                                   }finally{
//                                     authController.isLoading.value=false;
//                                   }
//                                 }else{
//                                   print("Form validation failed");
//                                 }
//                               },
//                               child: Text(
//                                 "3".tr,
//                                 style: TextStyle(
//                                   color: MyColor.MyWhite,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16.sp,
//                                 ),
//                               )),
//                         ),
//                       ),
//                       Positioned(
//                           top: 470.h,
//                           left: 70.h,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text("Do not have an email?"),
//                               InkWell(
//                                 onTap: () {
//                                   Get.to(RegisterPage());
//                                 },
//                                 child: Text(
//                                   "Register",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 15.sp,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ))
//                     ],
//                   ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
