import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraWidget extends StatefulWidget {
  final List<CameraDescription>cameras;
  CameraWidget({super.key, required this.cameras});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController  _controller;
  bool _isInitialize=false;

  @override
  void initState() {
    super.initState();
    _initializeCameraController();

  }
  Future<void> _initializeCameraController()async{
    _controller=CameraController(widget.cameras[0], ResolutionPreset.high);
    try{
      await _controller.initialize();
      setState(() {
        _isInitialize=true ;
      });
    }catch (e){
      print('Error initializing camera: $e');

    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Future<void>_capturePhoto()async{
    if(!_controller.value.isInitialized) return;
    try{
      final image=await _controller.takePicture();
      print('Photo captured at path: ${image.path}');

    }catch(e){
      print('Error capturing photo: $e');

    }
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: _isInitialize?
      Column(
        children: [
        AspectRatio(aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller),
        )

        ],
      )
          :Center(child: CircularProgressIndicator(),)
    );
  }
}
