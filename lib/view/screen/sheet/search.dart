import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaapp/controller/searchController.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {

    final SeaController searchController=Get.put(SeaController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: searchController.filterPhotos,
            decoration: InputDecoration(
              hintText: "Search photos...",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search)
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Obx((){
          if (searchController.filteredPhotos.isEmpty) {
            return Center(child: Text("No photos found"));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
              itemBuilder: (context, index) {
                final photo=searchController.filteredPhotos[index];
                return Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: Image.network(photo['url']??'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                      )),
                      Padding(padding: EdgeInsets.all(8.0),
                      child: Text( photo['title'] ?? 'Untitled', // Photo title
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),)
                    ],
                  ),
                );
              },);
        })
      ),
    );
  }
}
