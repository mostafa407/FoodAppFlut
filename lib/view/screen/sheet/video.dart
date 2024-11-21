import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaapp/controller/videoController.dart';
class VideoPage extends StatelessWidget {
  final VideoController videoController=Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
      ),
    );
  }
}
