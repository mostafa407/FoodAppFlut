import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaapp/constant/color.dart';
import 'package:instaapp/view/screen/login.dart';
import 'package:instaapp/view/screen/sheet/home.dart';
import 'package:instaapp/view/screen/sheet/profileedit.dart';
import 'package:instaapp/view/screen/sheet/search.dart';
import 'package:instaapp/view/screen/sheet/shop.dart';
import 'package:instaapp/view/screen/sheet/video.dart';
import 'package:instaapp/view/screen/sheet/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:camera/camera.dart';

class MyBottomNavBar extends StatefulWidget {

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

 //  List<CameraDescription> cameras=[];
 //  final int postId = 1; // Set the postId based on your app logic
 //
 // int _selectedIndex = 0;
 //
 //  static List<Widget> pages = <Widget>[
 //    HomePage(postId: postId,),
  final List<CameraDescription> cameras = [];
  final int postId = 1; // Set the postId based on your app logic
  int _selectedIndex = 0;
  late List<Widget> pages; // Initialize the pages list later

  @override
  void initState() {
    super.initState();
    // Initialize pages here so postId is accessible
    pages = <Widget>[
      HomePage(postId: postId),

      const SearchPage(),
      VideoPage(),
      const ShopPage(),
      const ProfilePage(cameras: [],)
    ];
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[_selectedIndex],
      //  appBar: AppBar(
      // // actions: [
      // //      IconButton(
      // //          onPressed: () async {
      // //            await FirebaseAuth.instance.signOut();
      // //            Get.offAll(() => LoginPage());
      // //          },
      // //          icon: Icon(Icons.exit_to_app))
      // //    ],
      // ),
      bottomNavigationBar: BottomNavigationBar(

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 30.sp,color: Get.isDarkMode?Colors.white:Colors.black), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 30.sp,color: Get.isDarkMode?Colors.white:Colors.black), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/2.svg",
                  color: Get.isDarkMode?Colors.white:Colors.black
              ), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/bag.svg",
                color: Get.isDarkMode?Colors.white:Colors.black,), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 30.sp,color: Get.isDarkMode?Colors.white:Colors.black), label: "")
        ],

        selectedItemColor: MyColor.MyWhite,
        unselectedItemColor: MyColor.MyWhite,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        iconSize: 25,
        // type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
