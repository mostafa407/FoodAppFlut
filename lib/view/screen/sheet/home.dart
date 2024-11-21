import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instaapp/constant/color.dart';
import 'package:instaapp/controller/colorController.dart';
import 'package:instaapp/controller/postController.dart';
import 'package:instaapp/view/screen/chat.dart';
import 'package:instaapp/view/screen/sheet/newPost.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaapp/view/screen/instgramLikes.dart';
// PostController to manage the image URL

// HomePage displaying uploaded images
class HomePage extends StatefulWidget {

  HomePage({Key? key, required this.postId}) : super(key: key);

  final int postId;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ColorController colorController=Get.put(ColorController());
  final PostController controller = Get.put(PostController());

 // Unique ID for each post
  final RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
          "Instagram",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Satisfy',
          ),
        ),
        actions: [
          IconButton(onPressed: () {
            Get.to(()=>Instgramlikes());
          }, icon: Icon(Icons.favorite_border)),
          InkWell(
            onTap: () {
              Get.to(() => ChatPage());
            },
            child: SvgPicture.asset(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              'assets/svg/message.svg',
              width: 20.w,
              height: 20.h,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(NewPostPage());
            },
            icon: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.sp),
                  height: 70.h, // Set a fixed height for the row of avatars
                  width: MediaQuery.of(context)
                      .size
                      .width, // Set width based on screen width
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            width: 60.w,
                            height: 60.h,
                            left: 20.sp,
                            child: CircleAvatar(
                              radius: 25.r, // Adjust the size
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
                        ],
                      ),
                      Positioned(
                          top: 30.sp,
                          left: 50.sp,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle,
                                color: MyColor.Myblue,
                              ))),
                      Positioned(
                        width: 60.w,
                        height: 60.h,
                        left: 110.sp,
                        // Adjust this to achieve overlap or spacing
                        child: CircleAvatar(
                          radius: 25.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.r),
                            child: Image.asset(
                              "assets/images/cat.jpeg",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 60.w,
                        height: 60.h,
                        left: 200.sp, // Increase for the next avatar
                        child: CircleAvatar(
                          radius: 25.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.r),
                            child: Image.asset(
                              "assets/images/dog.jpeg",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 60.w,
                        height: 60.h,
                        left: 280.sp,
                        child: CircleAvatar(
                          radius: 25.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.r),
                            child: Image.asset(
                              "assets/images/dog1.jpeg",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 70.w,
                        height: 70.h,
                        left: 350.sp,
                        child: CircleAvatar(
                          radius: 25.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.r),
                            child: Image.asset(
                              "assets/images/i.png",
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 60.w,
                        height: 60.h,
                        left: 350.sp,
                        child: CircleAvatar(
                          radius: 25.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70.r),
                            child: Image.asset(
                              "assets/images/i.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 70.w,
                        height: 70.h,
                        left: 350.sp,
                        child: CircleAvatar(
                          radius: 25.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70.r),
                            child: Image.asset(
                              "assets/images/i.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(),
                    height: 20.h,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      Positioned(
                          width: 70.w,
                          height: 70.h,
                          left: 30.sp,
                          child: Text(
                            "Ruffles",
                            style: TextStyle(),
                          )),
                      Positioned(
                          width: 70.w,
                          height: 70.h,
                          left: 120.sp,
                          // Adjust this to achieve overlap or spacing
                          child: Text("sabanok")),
                      Positioned(
                          width: 70.w,
                          height: 70.h,
                          left: 200.sp, // Increase for the next avatar
                          child: Text("blue_bouy")),
                      Positioned(
                          width: 70.w,
                          height: 70.h,
                          left: 290.sp,
                          child: Text("waggles")),
                      Positioned(
                          width: 70.w,
                          height: 70.h,
                          left: 350.sp,
                          child: Text("steve.loves")),
                    ]),
                  )
                ],
              )
            ],
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 20.sp),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        // Display story avatars...
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(thickness: 2.0),
          // Post StreamBuilder from Firestore
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

                return Card(
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(top: 5, bottom: 10, left: 5),
                            child: CircleAvatar(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  imageUrls.isNotEmpty ? imageUrls[0] : 'https://via.placeholder.com/150',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 50,
                            margin: EdgeInsets.only(left: 5),
                            alignment: Alignment.center,
                            child: Text("Ruffles"),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz_outlined),
                          ),
                        ],
                      ),
                      if (imageUrls.isNotEmpty)
                        Stack(
                          children: [
                            SizedBox(
                              height: 390,
                              child: PageView.builder(
                                onPageChanged: (value) {
                                  _currentIndex.value = value;
                                },
                                itemCount: imageUrls.length,
                                itemBuilder: (context, pageIndex) {
                                  return Image.network(
                                    imageUrls[pageIndex],
                                    height: 350,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              top: 20.sp,
                              left: 300.sp,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                child: Obx(() => Container(
                                  height: 22.h,
                                  width: 30.w,
                                  child: Text(
                                    '${_currentIndex.value + 1}/${imageUrls.length}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: MyColor.MyWhite,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                )),
                              ),
                            ),
                          ],
                        )
                      else
                        Image.network(
                          'https://via.placeholder.com/150',
                          height: 350,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      Row(
                        children: [
                          GetX<PostController>(
                            builder: (controller) => IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                size: 33.sp,
                                color: Get.isDarkMode
                                             ? Colors.white
                                       : Colors.black,
                              ),
                              onPressed: () {
                                if (widget.postId != null) {
                                  controller.toggleColor(widget.postId);
                                }
                              },
                              color: controller
                                       .postColors[widget.postId]?.value ??
                                           Colors.white,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/svg/comment.svg',
                              height: 25.h,
                              width: 25.w,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(width: 7.w),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/svg/send.svg',
                              height: 25.h,
                              width: 25.h,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/svg/send1.svg',
                              height: 25.h,
                              width: 25.w,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                        child: Text(
                          "100 likes",
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Username",
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt... more",
                          style: TextStyle(fontSize: 15.sp),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      )

//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore
//                   .collection('posts')
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text("No photos available"));
//                 }
//                 return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     var postData = snapshot.data!.docs[index];
//                     // Retrieve imageUrls safely
//                     List<dynamic> imageUrls =
//                         (postData.data() as Map<String, dynamic>)
//                                 .containsKey('imageUrls')
//                             ? List<String>.from(postData['imageUrls'])
//                             : []; // Use empty list if imageUrls doesn't exist
//                                   // Empty if no imageUrls
//                     print("Image URLs for post $index: $imageUrls");
//
//                     // Retrieve createdAt with a fallback
//                     DateTime createdAt = postData['createdAt'] != null
//                         ? (postData['createdAt'] as Timestamp).toDate()
//                         : DateTime.now();
//
//                     return Card(
//                       color: Get.isDarkMode ? Colors.black : Colors.white,
//                       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//                       shape: RoundedRectangleBorder(),
//                       elevation: 5,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 height: 40,
//                                 width: 40,
//                                 margin: EdgeInsets.only(
//                                     top: 5, bottom: 10, left: 5),
//                                 child: CircleAvatar(
//                                   radius: 25,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(100),
//                                     child: Image.network(
//                                       imageUrls.isNotEmpty
//                                           ? imageUrls[0]
//                                           : 'https://via.placeholder.com/150',
//                                       // Replace with placeholder
//                                       fit: BoxFit.cover,
//                                       width: double.infinity,
//                                       height: double.infinity,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 height: 40,
//                                 width: 50,
//                                 margin: EdgeInsets.only(left: 5),
//                                 alignment: Alignment.center,
//                                 child: Text("Ruffles"),
//                               ),
//                               Spacer(),
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.more_horiz_outlined),
//                               ),
//                             ],
//                           ),
//                           if (imageUrls.isNotEmpty)
//                             Stack(
//                               children: [
//                                 SizedBox(
//                                   height: 390,
//                                   child: PageView.builder(
//                                     onPageChanged: (v) {
//                                               // setState(() {
//                                                 _currentIndex.value=v;
//                                               // });
//                                     },
//                                     itemCount: imageUrls.length,
//                                     itemBuilder: (context, pageIndex) {
//                                       return ClipRRect(
//                                         child: Image.network(
//                                           imageUrls[pageIndex],
//                                           height: 350,
//                                           width: double.infinity,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 20.sp,
//                                   left: 300.sp
//                                   ,child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 8.0, horizontal: 16.0),
//                                     child: Obx(
//                                           () => Container(
//                                         height: 22.h,
//                                           width: 30.w
//                                         ,child: Text(
//                                           '${_currentIndex.value + 1}/${imageUrls.length}',
//                                           style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w500,
//                                           color:MyColor.MyWhite,),
//                                         textAlign: TextAlign.center,
//                                         ),
//                                         decoration: BoxDecoration(
//                                             color: Colors.grey,
//                                             borderRadius: BorderRadius.circular(50)),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           else
//                             ClipRRect(
//                               borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(15)),
//                               child: Image.network(
//                                 'https://via.placeholder.com/150',
//                                 // Replace with placeholder
//                                 height: 350,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           // Padding(
//                           //   padding: const EdgeInsets.symmetric(
//                           //       vertical: 8.0, horizontal: 16.0),
//                           //   child: Text(
//                           //     'Uploaded on ${createdAt.toLocal()}',
//                           //     style: TextStyle(
//                           //         fontSize: 14, fontWeight: FontWeight.w500),
//                           //   ),
//                           // ),
//                           Container(
//                             margin: EdgeInsets.only(),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 8.0, horizontal: 8.0),
//                               child: Row(
//                                 children: [
//                                   GetX<PostController>(
//                                     builder: (controller) => IconButton(
//                                       icon: Icon(
//                                         Icons.favorite_border,
//                                         size: 33.sp,
//                                         color: Get.isDarkMode
//                                             ? Colors.white
//                                             : Colors.black,
//                                       ),
//                                       onPressed: () {
//                                         if (widget.postId != null) {
//                                           controller.toggleColor(widget.postId!);
//                                         }
//                                       },
//                                       color: controller
//                                               .postColors[widget.postId]?.value ??
//                                           Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 2.w,
//                                   ),
//                                   InkWell(
//                                     onTap: () {},
//                                     child: SvgPicture.asset(
//                                       'assets/svg/comment.svg',
//                                       height: 25.h,
//                                       width: 25.w,
//                                       color: Get.isDarkMode
//                                           ? Colors.white
//                                           : Colors.black,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 7.w,
//                                   ),
//                                   InkWell(
//                                     child: SvgPicture.asset(
//                                       'assets/svg/send.svg',
//                                       height: 25.h,
//                                       width: 25.h,
//                                       color: Get.isDarkMode
//                                           ? Colors.white
//                                           : Colors.black,
//                                     ),
//                                     onTap: () {},
//                                   ),
//                                   Container(
//                                       height: 25.h,
//                                       width: 25.w,
//                                       margin: EdgeInsets.only(left: 200.sp),
//                                       child: InkWell(
//                                         onTap: () {},
//                                         child: SvgPicture.asset(
//                                           'assets/svg/send1.svg',
//                                           color: Get.isDarkMode
//                                               ? Colors.white
//                                               : Colors.black,
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20.0,bottom: 5.0),
//                             child: Text(
//                               "100 likes",
//                               style: TextStyle(
//                                   fontSize: 15.sp, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Wrap(
//                             direction: Axis.vertical
//                             ,children: [
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 20.0),
//                                     child: Text(
//                                       "Username",
//                                       style: TextStyle(
//                                           fontSize: 15.sp,fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10.0),
//                                     child: Text(
//                                       "Lorem ipsum dolor sit amet, "
//                                           "consectetur adipiscing elit, "
//                                           "sed do eiusmod tempor incididunt... more",
//                                       style: TextStyle(
//                                           fontSize: 15.sp),
//                                     maxLines: 3,
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//
//                             ],
//                           ),
//
// //
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           )
        ],
      ),
    );
  }
}

// AnotherPage displaying the uploaded image
// class AnotherPage extends StatelessWidget {
//   final PostController postController = Get.find<PostController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Uploaded Image"),
//       ),
//       body: Center(
//         child: Obx(() {
//           return postController.imageUrl.isNotEmpty
//               ? Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.network(postController.imageUrl.value), // Display the image
//               SizedBox(height: 20),
//               const Text("Image Uploaded Successfully!", style: TextStyle(fontSize: 18)),
//             ],
//           )
//               : CircularProgressIndicator(); // Show loading while waiting for the image URL
//         }),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:instaapp/constant/color.dart';
// import 'package:instaapp/view/screen/sheet/newPost.dart';
//
//
// class HomePage extends StatelessWidget {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Image.asset(
//           "assets/images/insta.png",
//           width: 120.w,
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.heart_broken_outlined)),
//           IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
//           IconButton(
//             onPressed: () {
//               Get.to(NewPostPage());
//             },
//             icon: Icon(Icons.add_box),
//           )
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           // Story and Other UI Elements
//           Wrap(
//             direction: Axis.vertical,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(top: 20.sp),
//                     height: 70.h,
//                     width: MediaQuery.of(context).size.width,
//                     child: Stack(
//                       children: [
//                         // Display story avatars...
//                       ],
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//           Divider(thickness: 2.0),
//           // Post StreamBuilder from Firestore
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore
//                   .collection('posts')
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text("No photos available"));
//                 }
//
//                 return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     var postData = snapshot.data!.docs[index];
//                     String imageUrl = postData['imageUrl'];
//                     DateTime createdAt = (postData['createdAt'] as Timestamp).toDate();
//
//                     return Card(
//                       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       elevation: 5,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//                             child: Image.network(
//                               imageUrl,
//                               height: 250,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                             child: Text(
//                               'Uploaded on ${createdAt.toLocal()}',
//                               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: Icon(Icons.favorite_border),
//                                       onPressed: () {
//                                         // Like action
//                                       },
//                                     ),
//                                     Text('Like'),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: Icon(Icons.comment),
//                                       onPressed: () {
//                                         // Comment action
//                                       },
//                                     ),
//                                     Text('Comment'),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: Icon(Icons.share),
//                                       onPressed: () {
//                                         // Share action
//                                       },
//                                     ),
//                                     Text('Share'),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //
//     //   Scaffold(
//     //   appBar: AppBar(
//     //     title: Image.asset(
//     //       "assets/images/insta.png",
//     //       width: 120.w,
//     //     ),
//     //     // leading: Image.asset("assets/images/insta.png",),
//     //     actions: [
//     //       IconButton(onPressed: () {}, icon: Icon(Icons.heart_broken_outlined)),
//     //       IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
//     //       IconButton(onPressed: () {}, icon: Icon(Icons.add_box))
//     //     ],
//     //   ),
//     //   body: Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     mainAxisAlignment: MainAxisAlignment.start,
//     //     children: [
//     //       Wrap(
//     //         direction: Axis.vertical,
//     //         children: [
//     //           Row(
//     //             children: [
//     //               Container(
//     //                 margin: EdgeInsets.only(top: 20.sp),
//     //                 height: 70.h, // Set a fixed height for the row of avatars
//     //                 width: MediaQuery.of(context)
//     //                     .size
//     //                     .width, // Set width based on screen width
//     //                 child: Stack(
//     //                   children: [
//     //                     Stack(
//     //                       children: [
//     //                         Positioned(
//     //                           width: 70.w,
//     //                           height: 70.h,
//     //                           left: 20.sp,
//     //                           child: CircleAvatar(
//     //                             radius: 25.r, // Adjust the size
//     //                             child: ClipRRect(
//     //                               borderRadius: BorderRadius.circular(90.r),
//     //                               child: Image.asset("assets/images/cat1.jpeg"),
//     //                             ),
//     //                           ),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                     Positioned(
//     //                         top: 30.sp,
//     //                         left: 60.sp,
//     //                         child: IconButton(
//     //                             onPressed: () {},
//     //                             icon: Icon(
//     //                               Icons.add_circle,
//     //                               color: MyColor.Myblue,
//     //                             ))),
//     //                     Positioned(
//     //                       width: 70.w,
//     //                       height: 70.h,
//     //                       left: 110.sp,
//     //                       // Adjust this to achieve overlap or spacing
//     //                       child: CircleAvatar(
//     //                         radius: 25.r,
//     //                         child: ClipRRect(
//     //                           borderRadius: BorderRadius.circular(90.r),
//     //                           child: Image.asset("assets/images/cat.jpeg"),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     Positioned(
//     //                       width: 70.w,
//     //                       height: 70.h,
//     //                       left: 200.sp, // Increase for the next avatar
//     //                       child: CircleAvatar(
//     //                         radius: 25.r,
//     //                         child: ClipRRect(
//     //                           borderRadius: BorderRadius.circular(90.r),
//     //                           child: Image.asset("assets/images/dog.jpeg"),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     Positioned(
//     //                       width: 70.w,
//     //                       height: 70.h,
//     //                       left: 280.sp,
//     //                       child: CircleAvatar(
//     //                         radius: 25.r,
//     //                         child: ClipRRect(
//     //                           borderRadius: BorderRadius.circular(90.r),
//     //                           child: Image.asset("assets/images/dog1.jpeg",fit: BoxFit.fill,),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     Positioned(
//     //                       width: 70.w,
//     //                       height: 70.h,
//     //                       left: 350.sp,
//     //                       child: CircleAvatar(
//     //                         radius: 25.r,
//     //                         child: ClipRRect(
//     //                           borderRadius: BorderRadius.circular(90.r),
//     //                           child: Image.asset("assets/images/i.png"),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     Positioned(
//     //                       width: 70.w,
//     //                       height: 70.h,
//     //                       left: 350.sp,
//     //                       child: CircleAvatar(
//     //                         radius: 25.r,
//     //                         child: ClipRRect(
//     //                           borderRadius: BorderRadius.circular(90.r),
//     //                           child: Image.asset("assets/images/i.png"),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ),
//     //               )
//     //             ],
//     //           )
//     //         ],
//     //       ),
//     //       Wrap(
//     //         direction: Axis.vertical,
//     //         children: [
//     //           Row(
//     //             children: [
//     //               Container(
//     //                 margin: EdgeInsets.only(),
//     //                  height: 30.h,
//     //                 width: MediaQuery.of(context)
//     //                     .size
//     //                     .width,
//     //                 child: Stack(children: [
//     //
//     //                       Positioned(
//     //                           width: 70.w,
//     //                           height: 70.h,
//     //                           left: 30.sp,
//     //                           child: Text("Ruffles",style: TextStyle(
//     //
//     //                           ),)),
//     //
//     //                   Positioned(
//     //                       width: 70.w,
//     //                       height: 70.h,
//     //                       left: 120.sp,
//     //                       // Adjust this to achieve overlap or spacing
//     //                       child: Text("sabanok")),
//     //                   Positioned(
//     //                       width: 70.w,
//     //                       height: 70.h,
//     //                       left: 200.sp, // Increase for the next avatar
//     //                       child: Text("blue_bouy")),
//     //                   Positioned(
//     //                       width: 70.w,
//     //                       height: 70.h,
//     //                       left: 290.sp,
//     //                       child: Text("waggles")),
//     //                   Positioned(
//     //                       width: 70.w,
//     //                       height: 70.h,
//     //                       left: 350.sp,
//     //                       child: Text("steve.loves")),
//     //                 ]),
//     //               )
//     //             ],
//     //           )
//     //         ],
//     //       ),
//     //         Divider(
//     //             thickness: 2.0,
//     //         )
//     //       ,Container(
//     //         margin: EdgeInsets.only(left: 10.sp,right: 10.sp),
//     //         child: Row(
//     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //           crossAxisAlignment: CrossAxisAlignment.start,
//     //           children: [
//     //             CircleAvatar(
//     //               child: ClipRRect(
//     //               borderRadius: BorderRadius.circular(50.r),
//     //                 child: Image.asset("assets/images/cat1.jpeg",fit: BoxFit.cover,),
//     //               ),
//     //             ),
//     //             Container(
//     //                 margin: EdgeInsets.only(right: 170.sp,top: 10.sp)
//     //                 ,child: Text("Ruffles",style: TextStyle(fontWeight: FontWeight.bold),)),
//     //             IconButton( onPressed: () {  }, icon: Icon(Icons.more_horiz),)
//     //           ],
//     //         ),
//     //       ),
//     //       Expanded(
//     //         child: ListView.builder(
//     //           itemCount: 10, // Example item count
//     //           itemBuilder: (context, index) {
//     //             return Padding(
//     //               padding: const EdgeInsets.all(8.0),
//     //               child: Card(
//     //                 shape: RoundedRectangleBorder(
//     //                   borderRadius: BorderRadius.circular(15.0),
//     //                 ),
//     //                 elevation: 5,
//     //                 child: Column(
//     //                   crossAxisAlignment: CrossAxisAlignment.start,
//     //                   children: [
//     //                     // Photo Section
//     //                     ClipRRect(
//     //                       borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//     //                       child: Image.asset(
//     //                         "assets/images/1.jpeg", // Your image path
//     //                         height: 250,
//     //                         width: double.infinity,
//     //                         fit: BoxFit.cover,
//     //                       ),
//     //                     ),
//     //                     // Like, Comment, Share Buttons
//     //                     Padding(
//     //                       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//     //                       child: Row(
//     //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                         children: [
//     //                           Row(
//     //                             children: [
//     //                               IconButton(
//     //                                 icon: Icon(Icons.favorite_border),
//     //                                 onPressed: () {
//     //                                   // Like action
//     //                                 },
//     //                               ),
//     //                               Text('Like'),
//     //                             ],
//     //                           ),
//     //                           Row(
//     //                             children: [
//     //                               IconButton(
//     //                                 icon: Icon(Icons.comment),
//     //                                 onPressed: () {
//     //                                   // Comment action
//     //                                 },
//     //                               ),
//     //                               Text('Comment'),
//     //                             ],
//     //                           ),
//     //                           Row(
//     //                             children: [
//     //                               IconButton(
//     //                                 icon: Icon(Icons.share),
//     //                                 onPressed: () {
//     //                                   // Share action
//     //                                 },
//     //                               ),
//     //                               Text('Share'),
//     //                             ],
//     //                           ),
//     //                         ],
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ),
//     //               ),
//     //             );
//     //           },
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // );
//     //   Container(
//     //   child: Center(child: Text("HomePage"))
//     // );
// //   }
// // }
