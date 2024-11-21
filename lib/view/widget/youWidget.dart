import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instaapp/constant/color.dart';

class Youwidget extends StatefulWidget {
  const Youwidget({super.key});

  @override
  State<Youwidget> createState() => _YouwidgetState();
}

class _YouwidgetState extends State<Youwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.sp, top: 10.sp),
              width: MediaQuery.of(context).size.width,
              height: 30.h,
              child: Text(
                "Follow Requests",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
              ),
            ),
            Divider(
              thickness: 1.0,
              // color: MyColor.Mygray,
            ),
            SizedBox(
              height: 70.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 15,
                      child: Text(
                    "New",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  )),
                  Container(
                    height: 60.h,
                    width: 375.w,
                    margin: EdgeInsets.only(top: 40.sp,right: 15.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.h,
                          child: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(44.r)
                              ,child: Image.asset("assets/images/girl.png"),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.sp),
                            child: Text("karennne liked your photo. 1h")),
                        Container(
                              width: 44,
                            height: 44
                            ,child: ClipRRect(child:  Image.asset("assets/images/sh.png"),))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
              // color: MyColor.Mygray,
            ),
            SizedBox(
              height: 70.h,
              child: Stack(
                children: [
                  Positioned(
                      left: 15,
                      child: Text(
                        "Today",
                        style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    height: 60.h,
                    width: 375.w,
                    margin: EdgeInsets.only(top: 40.sp, right: 15.sp,left: 15.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.h,
                          child: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(44.r),
                              child: Image.asset("assets/images/5.png"),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w), // Add space between the avatar and text
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 10.sp),
                            child: Text(
                              "kiero_d, zackjohn and 26 others liked your photo. 3h",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w), // Add space between the text and second image
                        Container(
                          width: 44.w,
                          height: 44.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r), // Add border radius if needed
                            child: Image.asset("assets/images/sh.png"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
