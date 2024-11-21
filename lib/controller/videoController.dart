import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  var videosList = <Map<String, dynamic>>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchVideos();

  }
  Future<void>fetchVideos() async{
    try{
      final snapshot=await _firestore.collection('videos').get();
      videosList.assignAll(snapshot.docs.map((doc)=>doc.data()as Map<String,dynamic>),
      );
    }catch(e){
      print("Error fetching videos:$e");
    }
  }
}
