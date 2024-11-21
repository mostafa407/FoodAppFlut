import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instaapp/constant/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:instaapp/controller/authController.dart';
import 'package:instaapp/utils/validators.dart';
import 'package:instaapp/view/widget/CustomTextForm.dart';
import 'package:instaapp/view/widget/MyBottomNavBar.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {

  final  GlobalKey<FormState> formState = GlobalKey<FormState>();
   final AuthController authController = Get.put(AuthController());
   final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   bool isObsecure=true;
   void togglePasswordVisibility(){
    setState(() {
      isObsecure = !isObsecure;

    });
   }

   @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(

        child:  Form(
        key: formState,
        child: SingleChildScrollView(
          child:
          Obx(()
          {
            return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 120.sp, left: 50.sp),
                height: 50.h,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Text(
                  "7".tr,
                  style: TextStyle(
                      fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 20,
                child: CustomTextForm(
                  hintText: "Name",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  funcValidator: (value) {
                    if (value == "") {
                      return "Please enter name";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 20,
                child: CustomTextForm(
                  hintText: "1".tr,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  funcValidator: Validators.validEmail
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 20,
                child: CustomTextForm(
                  controller: passwordController,
                  hintText: "2".tr,
                  isObsecure: isObsecure,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  funcValidator: Validators.validPassword,
                  changeVisibality: togglePasswordVisibility,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 20,
                margin: EdgeInsets.only(top: 20.sp, bottom: 20.sp),
                child: authController.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColor.Myblue),
                  onPressed: () async {
                    if (formState.currentState?.validate() ?? false) {
                      authController.isLoading.value = true;
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        Get.off(() => MyBottomNavBar());
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Weak Password',
                            desc: 'The password provided is too weak.',
                          )
                            ..show();
                        } else if (e.code == 'email-already-in-use') {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Email Already In Use',
                            desc: 'The account already exists for that email.',
                          )
                            ..show();
                        }
                      } catch (e) {
                        print(e);
                      } finally {
                        authController.isLoading.value = false;
                      }
                    } else {
                      print("Form validation failed");
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: MyColor.MyWhite),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                  ),
                ],
              ),
            ],
            );
          }),
        )
      ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get.dart';
// import 'package:instaapp/constant/color.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:instaapp/controller/authController.dart';
// import 'package:instaapp/controller/local_controller.dart';
// import 'package:instaapp/view/screen/MyBottomNavBar.dart';
// import 'package:instaapp/view/widget/CustomTextForm.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
//
// class RegisterPage extends StatelessWidget {
//   const RegisterPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final AuthController authController = Get.put(AuthController());
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//     MyLocalController myLocalController = Get.find<MyLocalController>();
//     GlobalKey<FormState> formState=GlobalKey<FormState>();
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: SingleChildScrollView(child: Obx(() {
//           return Form(
//              key: formState,
//             child: Column(
//               children: [
//                 Container(
//                     margin: EdgeInsets.only(top: 120.sp, left: 50.sp),
//                     height: 50.h,
//                     width: MediaQuery.of(context).size.width,
//                     child: Text(
//                       "7".tr,
//                       style:
//                           TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
//                     )),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 20,
//                   margin: EdgeInsets.only(top: 120.sp),
//                   child: CustomTextForm(
//                     hintText: "Name",
//                     controller: nameController,
//                     funcValidator: (value) {
//                       if(value==""){
//                         return "please enter name";
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 20,
//                   margin: EdgeInsets.only(top: 20.sp),
//                   child: CustomTextForm(
//                     hintText: "Email",
//                     controller: emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     funcValidator: (value) {
//                       if(value==""){
//                         return "please enter valid email";
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 20,
//                   margin: EdgeInsets.only(top: 20.sp),
//                   child: CustomTextForm(
//                     controller: passwordController,
//                     hintText: "Password",
//                     isObsecure: true,
//                     isPassword: true,
//                     keyboardType: TextInputType.visiblePassword,
//                     funcValidator: (value) {
//                         if (value=="") {
//                           return 'please enter valid Password';
//                         }
//                         return null;
//                     },
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 20,
//                   margin: EdgeInsets.only(top: 20.sp, bottom: 20.sp),
//                   child: authController.isLoading.value
//                       ? CircularProgressIndicator()
//                       : ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: MyColor.Myblue),
//                           onPressed: authController.isLoading.value?null:() async{
//                            if(formState.currentState?.validate()??false){
//                              authController.isLoading.value=true;
//                              try {
//                                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                                  email: emailController.text,
//                                  password: passwordController.text,
//                                );
//                                await credential.user?.updateDisplayName(nameController.text);
//                                Get.off(()=>HomePage());
//                              } on FirebaseAuthException catch (e) {
//                                if (e.code == 'weak-password') {
//                                  print('The password provided is too weak.');
//                                  AwesomeDialog(
//                                    context: context,
//                                    dialogType: DialogType.error,
//                                    animType: AnimType.rightSlide,
//                                    title: 'Weak Password',
//                                    desc: 'The password provided is too weak.',
//                                  )..show();
//                                } else if (e.code == 'email-already-in-use') {
//                                  print('The account already exists for that email.');
//                                  AwesomeDialog(
//                                    context: context,
//                                    dialogType: DialogType.error,
//                                    animType: AnimType.rightSlide,
//                                    title: 'Email Already In Use',
//                                    desc: 'The account already exists for that email.',
//                                  )..show();
//                                }
//                              } catch (e) {
//                                print(e);
//                              }
//                              finally{
//                                authController.isLoading.value=false;
//                              }
//                            }
//                            else{
//                              print("Form validation failed");
//                            }
//                           },
//                           child: Text(
//                             "Sign In",
//                             style: TextStyle(color: MyColor.MyWhite),
//                           )),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text("Already have an account?"),
//                     InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: Text(
//                         'Sign In',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18.sp),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );
//         })),
//       ),
//     );
//   }
// }
