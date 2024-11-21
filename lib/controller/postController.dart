import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController{
  final postColors = <int, Rx<Color>>{}.obs;

  var imageUrl = "".obs;
  var imageUrls = <String>[].obs; // Observable list to store image URLs
  void setImage(String url){
    imageUrl.value = url;
  }
  void toggleColor(int postId) {
    if (postColors[postId]?.value == Colors.red) {
      postColors[postId]?.value = Colors.grey;
    } else {
      postColors[postId] = Rx<Color>(Colors.red);
    }
  }
}