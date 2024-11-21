  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaapp/app_route.dart';
  import 'package:instaapp/constant/color.dart';

  class CustomTextForm extends StatelessWidget {
    const CustomTextForm({
      super.key,
      required this.hintText,
      this.controller,
      required this.funcValidator,
      this.iconData,
      this.isPassword = false,
      this.isObsecure = false,
      this.changeVisibality,
      this.isPhone = false,
      this.countryFlag,
      this.keyboardType = TextInputType.text,
    });

    final String hintText;
    final TextEditingController? controller;
    final String? Function(String?)? funcValidator;
    final IconData? iconData;
    final bool isPassword;
    final bool isObsecure;
    final Function? changeVisibality;
    final bool isPhone;
    final Function? countryFlag;
    final TextInputType keyboardType;

    @override
    Widget build(BuildContext context) {
      return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        color: Get.isDarkMode?Color(0xff262626):Color(0xffD9D9D9),
        elevation: 20,
        child: TextFormField(
          style: TextStyle(
            color: Get.isDarkMode?MyColor.MyWhite:MyColor.Myblack
          ),
            validator: funcValidator ?? (value) => null,
            keyboardType: keyboardType,
            controller: controller ?? TextEditingController(),
            obscureText: isObsecure,
            decoration: InputDecoration(
                suffixIcon: isPassword
                    ? GestureDetector(
                        onTap: () {
                          if (changeVisibality != null) {
                            changeVisibality!();
                          }
                            },
                        child: Icon(
                        color: Get.isDarkMode?Colors.white:Colors.black
                        ,isObsecure ? Icons.visibility_off : Icons.visibility))
                    : null,
                // prefixIcon: isPhone
                //     ? CountryCodePicker(
                //   onChanged: (CountryCode value) {
                //     countryFlag!(value);
                //   },
                //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                //   initialSelection: 'EG',
                //   padding: EdgeInsets.all(0),
                //   showFlag: false,
                //   favorite: ['+39', 'EG'],
                //   // optional. Shows only country name and flag
                //   showCountryOnly: false,
                //   // optional. Shows only country name and flag when popup is closed.
                //   showOnlyCountryWhenClosed: false,
                //   // optional. aligns the flag and the Text left
                //   alignLeft: false,
                // )
                //     : Icon(
                //   iconData,
                //   color: Colors.red,
                // ),

                contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                hintText: hintText,
                hintStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),
                fillColor: Get.isDarkMode?Color(0xff262626):Color(0xffD9D9D9),
                
                filled: true,
                enabled: true,
                // border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(250)
                // ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.transparent)))),
      );
    }
  }
