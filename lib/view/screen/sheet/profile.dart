import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaapp/app_route.dart';
import 'package:instaapp/constant/color.dart';
import 'package:instaapp/view/screen/login.dart';
import 'package:instaapp/view/screen/sheet/profileedit.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaapp/view/widget/galeryWidget.dart';
import 'package:instaapp/view/widget/cameraWidget.dart';
import 'package:instaapp/view/widget/videoWidget.dart';
import 'package:camera/camera.dart';

class ProfilePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const ProfilePage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedSegment = 2;
  final int postId=2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            margin: EdgeInsets.only(),
            child: Text(
              "username",
              style: TextStyle(fontSize: 22.sp),
            )),
        actions: [
          Container(
              margin: EdgeInsets.only(), child: Icon(Icons.add_box_outlined)),
          Builder(
            builder: (context) => Container(
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.menu),
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 90.w,
                        height: 90.h,
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.r),
                            child: Image.asset(
                              "assets/images/cat1.jpeg",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 100.sp),
                        child: IconButton(
                          onPressed: () {
                            Get.changeTheme(Get.isDarkMode
                                ? ThemeData.light()
                                : ThemeData.dark());
                          },
                          icon: Icon(
                            Get.isDarkMode
                                ? Icons.color_lens
                                : Icons.color_lens,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width - 150.w,
              margin: EdgeInsets.only(top: 50.sp),
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: MyColor.Myblue),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.offAll(() => LoginPage());
                  },
                  child: Text(
                    "logout",
                    style: TextStyle(color: MyColor.MyWhite),
                  )),
            )
          ],
        ),
      ),
      body: Container(
        child: Container(
          margin: EdgeInsets.only(top: 20.sp),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 90.w,
                    height: 90.h,
                    child: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90.r),
                        child: Image.asset(
                          "assets/images/cat1.jpeg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "1,234",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      Text("Posts")
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "5,678",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "9,101",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      Text("Following")
                    ],
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(right: 230.sp, top: 5.sp),
                  child: Text(
                    "Username",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: EdgeInsets.only(right: 180.sp),
                child: Text(
                  "Category/Genre text",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode ? Colors.grey : Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.sp, right: 10.sp, top: 5.sp),
                child: Text(
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt #hashtag"),
              ),
              Container(
                margin: EdgeInsets.only(right: 205.sp, top: 5.sp),
                child: InkWell(
                  child: Text(
                    "Link goes here",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColor.Myblue),
                  ),
                ),
              ),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30.sp, top: 10.sp),
                        width: MediaQuery.of(context).size.width,
                        height: 50.sp,
                        child: Stack(
                          children: [
                            Positioned(
                              child: CircleAvatar(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.asset(
                                        "assets/images/insta2.png")),
                              ),
                            ),
                            Positioned(
                              left: 15.sp,
                              child: CircleAvatar(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.asset("assets/images/i.png")),
                              ),
                            ),
                            Positioned(
                              left: 25.sp,
                              child: CircleAvatar(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child:
                                        Image.asset("assets/images/insta.png")),
                              ),
                            ),
                            Positioned(
                                width: 230.w,
                                height: 50.h,
                                left: 70.sp,
                                child: Text(
                                  "Folowed by username,username and 100 others",
                                  maxLines: 2,
                                  style: TextStyle(),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.sp),
                    width: MediaQuery.of(context).size.width - 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffEFEFEF),
                            shape: RoundedRectangleBorder()),
                        onPressed: () {
                          Get.to(Profileedit());
                        },
                        child: Text(
                          "Edit profile",
                          style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),
                        )),
                  ),
                  Container(
                    child: IconButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffEFEFEF),
                          shape: RoundedRectangleBorder()),
                      onPressed: () {},
                      icon: Icon(Icons.person),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Wrap(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.r),
                            child: Image.asset("assets/images/1.jpeg"),
                          ),
                        ),
                      ),
                      Container(
                        width: 60.w,
                        height: 60.h,
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.r),
                            child: Image.asset("assets/images/2.jpeg"),
                          ),
                        ),
                      ),
                      Container(
                        width: 60.w,
                        height: 60.h,
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.r),
                            child: Image.asset("assets/images/3.jpeg"),
                          ),
                        ),
                      ),
                      Container(
                        width: 60.w,
                        height: 60.h,
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.r),
                            child: Image.asset("assets/images/4.jpeg"),
                          ),
                        ),
                      ),
                      Container(
                        width: 60.w,
                        height: 60.h,
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.r),
                            child: Image.asset("assets/images/5.jpeg"),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Wrap(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //   width: 10.w,
                        //   height: 10.h,
                        child: Text(
                          "Text  here",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        //   width: 10.w,
                        //   height: 10.h,
                        child: Text(
                          "Text  here",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        //   width: 10.w,
                        //   height: 10.h,
                        child: Text(
                          "Text  here",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        //   width: 10.w,
                        //   height: 10.h,
                        child: Text(
                          "Text  here",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        //   width: 10.w,
                        //   height: 10.h,
                        child: Text(
                          "Text  here",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomSlidingSegmentedControl<int>(
                  isStretch: true,
                  initialValue: 1,
                  children: {
                    1: SvgPicture.asset("assets/svg/1.svg"),
                    2: SvgPicture.asset(
                      "assets/svg/2.svg",
                    ),
                    3: InkWell(
                      child: SvgPicture.asset("assets/svg/3.svg"),
                      onTap: () {
                        CameraWidget(
                          cameras: widget.cameras,
                        );
                      },
                    ),
                  },
                  decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    setState(() {
                      _selectedSegment = v;
                    });
                  },
                  innerPadding: EdgeInsets.zero,
                  height: 50.h,
                ),
              ),
              Expanded(child: _buildSegmentContent())
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentContent() {
    switch (_selectedSegment) {
      case 1:
        return Galerywidget(postId: postId,);
      case 2:
        return VideoWidget(); // Custom widget for Map
      case 3:
        return CameraWidget(
          cameras: widget.cameras,
        ); // Custom widget for Paper
      default:
        return Container(
          color: Colors.red,
        );
    }
  }
}
