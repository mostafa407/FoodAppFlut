import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaapp/constant/color.dart';
import 'package:instaapp/controller/postController.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Galerywidget extends StatefulWidget {
  const Galerywidget({super.key,required this.postId});
  final int postId;

  @override
  State<Galerywidget> createState() => _GalerywidgetState();
}

class _GalerywidgetState extends State<Galerywidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxInt _currentIndex = 0.obs;


  @override
  Widget build(BuildContext context) {
    return
      Expanded(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('posts').orderBy('createdAt', descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No photos available"));
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var postData = snapshot.data!.docs[index];
                List<dynamic> imageUrls = (postData.data() as Map<String, dynamic>).containsKey('imageUrls')
                    ? List<String>.from(postData['imageUrls'])
                    : [];
                DateTime createdAt = postData['createdAt'] != null
                    ? (postData['createdAt'] as Timestamp).toDate()
                    : DateTime.now();

                return
// Wrap this widget in an Expanded widget if it’s part of a larger layout
                  GridView.builder(
                    padding: EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,  // Adjust the number of columns here
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.0, // Adjust aspect ratio as needed
                    ),
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      );
                    },
                  );

                //   Card(
                //   color: Get.isDarkMode ? Colors.black : Colors.white,
                //   margin: EdgeInsets.symmetric(vertical: 10),
                //   elevation: 5,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         children: [
                //           Container(
                //             height: 40,
                //             width: 40,
                //             margin: EdgeInsets.only(top: 5, bottom: 10, left: 5),
                //             child: CircleAvatar(
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(100),
                //                 child: Image.network(
                //                   imageUrls.isNotEmpty ? imageUrls[0] : 'https://via.placeholder.com/150',
                //                   fit: BoxFit.cover,
                //                   width: double.infinity,
                //                   height: double.infinity,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Container(
                //             height: 40,
                //             width: 50,
                //             margin: EdgeInsets.only(left: 5),
                //             alignment: Alignment.center,
                //             child: Text("Ruffles"),
                //           ),
                //           Spacer(),
                //           IconButton(
                //             onPressed: () {},
                //             icon: Icon(Icons.more_horiz_outlined),
                //           ),
                //         ],
                //       ),
                //       if (imageUrls.isNotEmpty)
                //         Stack(
                //           children: [
                //             SizedBox(
                //               height: 390,
                //               child: PageView.builder(
                //                 onPageChanged: (value) {
                //                   _currentIndex.value = value;
                //                 },
                //                 itemCount: imageUrls.length,
                //                 itemBuilder: (context, pageIndex) {
                //                   return Image.network(
                //                     imageUrls[pageIndex],
                //                     height: 350,
                //                     width: double.infinity,
                //                     fit: BoxFit.cover,
                //                   );
                //                 },
                //               ),
                //             ),
                //             Positioned(
                //               top: 20.sp,
                //               left: 300.sp,
                //               child: Padding(
                //                 padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                //                 child: Obx(() => Container(
                //                   height: 22.h,
                //                   width: 30.w,
                //                   child: Text(
                //                     '${_currentIndex.value + 1}/${imageUrls.length}',
                //                     style: TextStyle(
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.w500,
                //                       color: MyColor.MyWhite,
                //                     ),
                //                     textAlign: TextAlign.center,
                //                   ),
                //                   decoration: BoxDecoration(
                //                     color: Colors.grey,
                //                     borderRadius: BorderRadius.circular(50),
                //                   ),
                //                 )),
                //               ),
                //             ),
                //           ],
                //         )
                //       else
                //         Image.network(
                //           'https://via.placeholder.com/150',
                //           height: 350,
                //           width: double.infinity,
                //           fit: BoxFit.cover,
                //         ),
                //       Row(
                //         children: [
                //           GetX<PostController>(
                //             builder: (controller) => IconButton(
                //               icon: Icon(
                //                 Icons.favorite_border,
                //                 size: 33.sp,
                //                 color: Get.isDarkMode
                //                     ? Colors.white
                //                     : Colors.black,
                //               ),
                //               onPressed: () {
                //                 if (widget.postId != null) {
                //                   controller.toggleColor(widget.postId);
                //                 }
                //               },
                //               color: controller
                //                   .postColors[widget.postId]?.value ??
                //                   Colors.white,
                //             ),
                //           ),
                //           SizedBox(width: 2.w),
                //           InkWell(
                //             onTap: () {},
                //             child: SvgPicture.asset(
                //               'assets/svg/comment.svg',
                //               height: 25.h,
                //               width: 25.w,
                //               color: Get.isDarkMode ? Colors.white : Colors.black,
                //             ),
                //           ),
                //           SizedBox(width: 7.w),
                //           InkWell(
                //             onTap: () {},
                //             child: SvgPicture.asset(
                //               'assets/svg/send.svg',
                //               height: 25.h,
                //               width: 25.h,
                //               color: Get.isDarkMode ? Colors.white : Colors.black,
                //             ),
                //           ),
                //           Spacer(),
                //           InkWell(
                //             onTap: () {},
                //             child: SvgPicture.asset(
                //               'assets/svg/send1.svg',
                //               height: 25.h,
                //               width: 25.w,
                //               color: Get.isDarkMode ? Colors.white : Colors.black,
                //             ),
                //           ),
                //         ],
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                //         child: Text(
                //           "100 likes",
                //           style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 20.0),
                //         child: Text(
                //           "Username",
                //           style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10.0),
                //         child: Text(
                //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt... more",
                //           style: TextStyle(fontSize: 15.sp),
                //           maxLines: 3,
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              },
            );
          },
        ),
      );
  }
}
