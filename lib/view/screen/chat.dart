import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instaapp/app_route.dart';
import 'package:instaapp/constant/color.dart';
import 'package:instaapp/view/screen/sheet/home.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  final int postId=1;
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Container(
        margin: EdgeInsets.only(right: 8.0.w),
        height: 40.h,
        width: 40.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.r),
          child: Image.asset("assets/images/5.png", fit: BoxFit.cover),
        ),
      ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username",style: TextStyle(color: MyColor.Myblack,fontSize: 20.sp),),
                  Text("Username"),
                ],
              ),
            ),
          ],
        ),
        actions: [
      IconButton(
      icon: Icon(Icons.phone_outlined, color: MyColor.Myblack),
      onPressed: () {
        // Add notification functionality
      },
    ),
    IconButton(
    icon: Icon(Icons.video_call, color: MyColor.Myblack),
    onPressed: () {
    // Add settings functionality
    },
    )  ],

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Start list from the bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _messages[_messages.length - 1 - index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter your message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
