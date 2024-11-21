import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instaapp/constant/color.dart';
import 'package:instaapp/controller/postController.dart';
import 'package:instaapp/view/screen/sheet/home.dart';
import 'package:path/path.dart' as path;

class NewPostPage extends StatefulWidget {
  @override
  NewPostPageState createState() => NewPostPageState();
}

class NewPostPageState extends State<NewPostPage> {
  final PostController postController = Get.find<PostController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  List<File> imageFiles = []; // List of selected images

  final int postId = 1; // Set the postId based on your app logic

  Future<void> pickImages() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        imageFiles = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
      });
    } else {
      print("No images selected");
    }
  }

  Future<void> uploadPhotos() async {
    if (imageFiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select at least one image first.")));
      return;
    }

    try {
      List<String> imageUrls = []; // List to store uploaded image URLs

      // Upload each image
      for (File imageFile in imageFiles) {
        String fileName = path.basename(imageFile.path);
        Reference storageRef = storage.ref().child('photos/$fileName');
        TaskSnapshot snapshot = await storageRef.putFile(imageFile);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        imageUrls.add(downloadUrl);
        print("Uploaded: $downloadUrl");
      }

      // Store the image URLs and timestamp in Firestore
      await firestore.collection('posts').add({
        'imageUrls': imageUrls,
        'createdAt': Timestamp.now(),
      });

      setState(() {
        imageFiles.clear(); // Reset the selected images
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Successfully uploaded images.")));
      postController.imageUrls.value = imageUrls;
      Get.to(HomePage(postId: postId,));
    } catch (e) {
      print('Error occurred while uploading: $e');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to upload images. Please try again.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("New Post"),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 30.sp),
            child: TextButton(
              onPressed: uploadPhotos,
              child: Text(
                "Add",
                style: TextStyle(color: MyColor.Myblue, fontSize: 18.sp),
              ),
            ),
          ),
          SizedBox(width: 10.sp),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return postController.imageUrls.isNotEmpty
                  ? Column(
                children: [
                  SizedBox(
                    height: 150.h,
                    child: PageView.builder(
                      itemCount: postController.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          postController.imageUrls[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text("Images Uploaded Successfully!",
                      style: TextStyle(fontSize: 18)),
                ],
              )
                  : imageFiles.isNotEmpty
                  ? SizedBox(
                height: 150.h,
                child: PageView.builder(
                  itemCount: imageFiles.length,
                  itemBuilder: (context, index) {
                    return Image.file(
                      imageFiles[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              )
                  : Text("No Images Selected");
            }),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: pickImages,
              child: Text('Select Photos'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_common/get_reset.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:instaapp/constant/color.dart';
// import 'package:instaapp/controller/postController.dart';
// import 'package:instaapp/view/screen/sheet/home.dart';
// import 'package:path/path.dart' as path;
//
// class NewPostPage extends StatefulWidget {
//   @override
//   NewPostPageState createState() => NewPostPageState();
// }
//
// class NewPostPageState extends State<NewPostPage> {
//   final PostController postController = Get.find<PostController>();
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   FirebaseStorage storage = FirebaseStorage.instance;
//   File? imageFile;
//
//   Future<void> pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }else{
//       print("No image selected"); // Optional: Handle if no image is selected
//     }
//   }
//
//   Future<void> uploadPhoto() async {
//     if (imageFile == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please select an image first.")));
//       return; // Exit early if no image is selected
//     }
//
//     try {
//       String fileName = path.basename(imageFile!.path);
//       Reference storageRef = storage.ref().child('photos/$fileName');
//
//       // Log the file name and the reference path
//       print("Uploading file: $fileName to path: photos/$fileName");
//
//       // Upload the file
//       TaskSnapshot snapshot = await storageRef.putFile(imageFile!);
//
//       // Log the progress
//       print("Upload completed: ${snapshot.bytesTransferred} bytes uploaded.");
//
//       // Get the download URL
//       String downloadUrl = await snapshot.ref.getDownloadURL();
//       print("Download URL obtained: $downloadUrl");
//
//       // Store the image URL and timestamp in Firestore
//       await firestore.collection('posts').add({
//         'imageUrl': downloadUrl,
//         'createdAt': Timestamp.now(),
//       });
//       setState(() {
//         imageFile = null; // Reset the image file
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Successfully uploaded image.")));
//       postController.imageUrl.value = downloadUrl;
//       Get.to(HomePage());
//     } catch (e) {
//       // Log the error for debugging
//       print('Error occurred while uploading: $e');
//
//       // Show an error message
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Failed to upload image. Please try again.")));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.cancel),
//           onPressed: () => Navigator.of(context).pop(), // Add back navigation
//         ),
//         title: Text("New Post"),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(left: 30.sp),
//             child: TextButton(
//               onPressed: uploadPhoto,
//               child: Text(
//                 "Add",
//                 style: TextStyle(color: MyColor.Myblue, fontSize: 18.sp),
//               ),
//             ),
//           ),
//           SizedBox(width: 10.sp), // Space between buttons
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() {
//               return postController.imageUrl.isNotEmpty
//                   ? Column(
//                       children: [
//                         Image.network(postController.imageUrl.value),
//                         // Display the image
//                         SizedBox(height: 20),
//                         const Text("Image Uploaded Successfully!",
//                             style: TextStyle(fontSize: 18)),
//                       ],
//                     )
//                   : imageFile != null
//                       ? Image.file(imageFile!,
//                           height: 150.h) // Show selected image
//                       : Text("No Image Selected");
//             }),
//             SizedBox(height: 20.h),
//             ElevatedButton(
//               onPressed: pickImage,
//               child: Text('Select Photo'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
