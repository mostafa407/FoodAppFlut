import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaapp/app_route.dart';
import 'package:instaapp/constant/color.dart';

class Custometextformeditprofile extends StatelessWidget {
  const Custometextformeditprofile({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.isDarkMode?Colors.black54:Colors.white,
      child: TextFormField(
        style: TextStyle(
        )
         ,
        decoration: InputDecoration(
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12))

          ),

      ),);
  }
}
