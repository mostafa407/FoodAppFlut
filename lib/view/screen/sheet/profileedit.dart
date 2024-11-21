import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaapp/constant/color.dart';
import 'package:instaapp/controller/ImagePickerController%20.dart';
import 'package:instaapp/controller/local_controller.dart';
import 'package:instaapp/view/screen/sheet/profile.dart';
import 'package:instaapp/view/widget/CustomTextForm.dart';
import 'package:instaapp/view/widget/CustomeTextFormEditProfile.dart';

class Profileedit extends StatefulWidget {
  const Profileedit({super.key});

  @override
  State<Profileedit> createState() => _ProfileeditState();
}

class _ProfileeditState extends State<Profileedit> {

  final ImagePickerController imagePickerController =
  Get.put(ImagePickerController());
  MyLocalController localController = Get.find<MyLocalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 10.sp, top: 10.sp),
          child: InkWell(
            onTap: () {
              Get.off(ProfilePage(cameras: [],));
            },
            child: Text(
              '6'.tr,
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 50.sp),
          child: Text(
            "5".tr,
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.sp),
            child: Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Text(
                      "4".tr,
                      style: TextStyle(
                          color: MyColor.Myblue,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        Container(
        margin: EdgeInsets.only(
        top: 30.sp,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Obx((){
              final selectImage= imagePickerController.selectImage.value;
              return selectImage != null
              ? Image.file(
              imagePickerController.selectImage.value!,
            height: 200.h,
                width: 200.w,
        fit: BoxFit.cover,
      )
          : Container(
                            width: 100.w,
      height: 100.h,
      child: ClipRRect(
        child: Image.asset("assets/images/i.png"),
        borderRadius: BorderRadius.circular(100.r),
      ),
      );
      }),

    InkWell(
    onTap: () {
    imagePickerController.takePhoto();
    },
    child: Text(
    "Change Profile Photo",
    style: TextStyle(color: MyColor.Myblue),
    ),
    ),
    ],
    ),
    ),
    Container(
    width: 370.w,
    height: 210.h,
    margin: EdgeInsets.only(top: 30.sp,left: 20.sp),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Container(

    child: Text(
    "Name",
    style: TextStyle(
    fontSize: 18.sp, fontWeight: FontWeight.w400),
    ),
    ),
    Container(
    margin: EdgeInsets.only(left: 35.sp,right: 5.sp),
    child: SizedBox(
    width: MediaQuery.of(context).size.width - 110.w,
    height: 30.h,
    child: Custometextformeditprofile(

    ),
    ),
    )
    ],
    ),
    ),
    SizedBox(
    height: 10.h,
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Text(
    "Username",
    style: TextStyle(
    fontSize: 18.sp, fontWeight: FontWeight.w400),
    ),
    Container(
    margin: EdgeInsets.only(right: 5.sp),
    child: SizedBox(
    width: MediaQuery.of(context).size.width - 110.w,
    height: 30.h,
    child: Custometextformeditprofile(

    ),
    ),
    )
    ],
    ),
    ),
    SizedBox(
    height: 10.h,
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Text(
    "Website",
    style: TextStyle(
    fontSize: 18.sp, fontWeight: FontWeight.w400),
    ),
    Container(
    margin: EdgeInsets.only(left: 18.sp,right: 5.sp),
    child: SizedBox(
    width: MediaQuery.of(context).size.width - 110.w,
    height: 30.h,
    child: Custometextformeditprofile(

    ),
    ),
    )

    ],
    ),
    ),
    SizedBox(
    height: 10.h,
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Text(
    "Bio",
    style: TextStyle(
    fontSize: 18.sp, fontWeight: FontWeight.w400),
    ),
    Container(
    margin: EdgeInsets.only(left: 60.sp,right: 5.sp),
    child: SizedBox(
    width: MediaQuery.of(context).size.width - 110.w,
    height: 30.h,
    child: Custometextformeditprofile(

    ),
    ),
    )

    ],
    ),
    ),
    SizedBox(
    height: 20.h,
    ),
    Divider(
    endIndent: 20,
    ),
    SizedBox(
    height: 10.h,
    ),
    ],
    ),
    ),
    Container(
    height: 18.h,
    margin: EdgeInsets.only(
    right: 70.sp,
    ),
    child: InkWell(
    child: Text(
    "Switch to Professional Account",
    style: TextStyle(color: MyColor.Myblue, fontSize: 18.sp),
    ),
    ),
    ),
    Container(
    width: 300.w,
    height: 200.h,
    margin: EdgeInsets.only(top: 30.sp,right: 30.sp),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    child: Text(
    "Private information",
    style: TextStyle(fontSize: 18.sp),
    ),
    ),
    SizedBox(
    height: 10.h,
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Text(
    "Email",
    style: TextStyle(
    fontSize: 18.sp, fontWeight: FontWeight.w400),
    ),
    Container(
    margin: EdgeInsets.only(left: 35.sp,right: 5.sp),
    child: SizedBox(
    width: MediaQuery.of(context).size.width - 110.w,
    height: 30.h,
    child: Custometextformeditprofile(

    ),
    ),
    )

    ],
    ),
    ),
    SizedBox(
    height: 10.h,
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Text(
    "Phone",
    style: TextStyle(
    fontSize: 18.sp, fontWeight: FontWeight.w400),
    ),
    Container(
    margin: EdgeInsets.only(left: 30.sp,right: 5.sp),
    child: SizedBox(
    width: MediaQuery.of(context).size.width - 110.w,
    height: 30.h,
    child: Custometextformeditprofile(

    ),
    ),
    )

    ],
    ),
    ),
    SizedBox(
    height: 10.h,
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text(
    "Gender",
    style: TextStyle(
    fontSize: 18.sp, fontWeight: FontWeight.w400),
    ),
    Container(
    margin: EdgeInsets.only(left: 20.sp,right: 5.sp),
    child: SizedBox(
    width: MediaQuery.of(context).size.width - 100.w,
    height: 30.h,
    child: Custometextformeditprofile(

    ),
    ),
    )

    ],
    ),
    ),
    SizedBox(
    height: 10.h,
    ),

    ],
    ),
    ),
    ],
    ),
    )
    ,
    );
  }
}
