import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SeaController extends GetxController{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  var photos=<Map<String,dynamic>>[].obs;
  var filteredPhotos = <Map<String, dynamic>>[].obs;

    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPhotos();
    }
    Future<void>fetchPhotos()async{
      try{
        final snapshot = await _firestore.collection('photos').get();
        photos.assignAll(
          snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>),
        );
        filteredPhotos.assignAll(photos);
      }catch (e){
        print("Error fetching photos :$e");
      }
    }
   void filterPhotos(String query){
      if(query.isEmpty){
        filteredPhotos.assignAll(photos);
      }else{
        filteredPhotos.assignAll(photos.where((photo)=>(photo['title']??'')
        .toString().toLowerCase().contains(query.toLowerCase())
        ));
      }
   }
}