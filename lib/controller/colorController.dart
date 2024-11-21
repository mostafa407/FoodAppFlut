import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController{
  Rx<Color> iconColor = Colors.black.obs;
  void toggleColor(){
    iconColor.value=iconColor.value==Colors.black?Colors.red:Colors.black;
  }

}