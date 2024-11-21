import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaapp/constant/string.dart';
import 'package:instaapp/view/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instaapp/view/widget/MyBottomNavBar.dart';

class AppRoute {
  AppRoute() {

  }

  MaterialPageRoute? generateRoute(RouteSettings settings,
      {required bool isDarkMode, required Function toggleTheme}) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => FirebaseAuth.instance.currentUser==null? LoginPage(
            isDarkMode: isDarkMode,
            toggleTheme: toggleTheme,

          ):MyBottomNavBar(),
        );
      default:
        return null;
    }
  }
}
