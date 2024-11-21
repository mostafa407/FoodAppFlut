// import 'dart:io';
//
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImagePickerController  extends GetxController{
//   // var selectImage=Rxn<File?>(null);
//   var selectImage = Rxn<File?>();  // Nullable Rx
//
//   final ImagePicker picker=ImagePicker();
//   Future<void>pickImage()async{
//     final pickFile=await picker.pickImage(source: ImageSource.gallery);
//     if(pickFile!=null){
//       selectImage.value=File(pickFile.path);
//     }
//   }
//   Future<void> takePhoto() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       selectImage.value = File(pickedFile.path);
//     }
//   }
//
// }

import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';  // Add this if you plan to handle permissions dynamically

class ImagePickerController extends GetxController {
  var selectImage = Rxn<File?>(); // Nullable Rx

  final ImagePicker picker = ImagePicker();

  // Method to pick an image from the gallery
  Future<void> pickImage() async {
    // Check permission before picking an image
    await _requestGalleryPermission();

    final pickFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      selectImage.value = File(pickFile.path);
    }
  }

  // Method to take a photo using the camera
  Future<void> takePhoto() async {
    // Check permission before taking a photo
    await _requestCameraPermission();

    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectImage.value = File(pickedFile.path);
    }
  }

  // Check for gallery permission
  Future<void> _requestGalleryPermission() async {
    PermissionStatus status = await Permission.photos.request();
    if (status != PermissionStatus.granted) {
      print("Gallery permission not granted");
      // Handle permission denial (maybe show a dialog to the user)
    }
  }

  // Check for camera permission
  Future<void> _requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      print("Camera permission not granted");
      // Handle permission denial (maybe show a dialog to the user)
    }
  }
}
