import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:instaapp/view/widget/MyBottomNavBar.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isLoading = false.obs;

  Future<void> registersUser(String name, String email, String password) async{
    try {
      isLoading.value = true;
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
            String uid=userCredential.user!.uid;
            await _firestore.collection('users').doc(uid).set({
              "name":name,
              "email":email
            });
            isLoading.value=false;
            //Get.snackbar("Success", "User registered successfully");
             Get.off(()=>MyBottomNavBar());
    } on FirebaseAuthException catch (e) {
      isLoading.value=false;
      Get.snackbar("Error", e.message?? "Unknown error occurred");
    }
  }
}