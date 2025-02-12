import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class CameraScreen extends StatefulWidget {
  final String type;
  final CameraDescription camera;
  const CameraScreen({super.key, required this.type, required this.camera});

  @override
  State<CameraScreen> createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
      enableAudio: false,
      fps: 60,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> cropImage(String path) async {
    var file = File(path);
    List<CropAspectRatioPreset> ratioKtp = [CropAspectRatioPreset.ratio4x3];
    CropAspectRatio ratioSelfie = const CropAspectRatio(ratioX: 3, ratioY: 4);
    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: widget.type == 'selfie' ? ratioSelfie : null,
      aspectRatioPresets: ratioKtp,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop',
          cropGridColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
        IOSUiSettings(title: 'Crop')
      ],
    );

    if (cropped != null) {
      return cropped.path;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_controller);
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          const SizedBox(height: 150),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      height: 160,
      width: double.maxFinite,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              widget.type,
              // style: textBody2(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    try {
                      // Ensure that the camera is initialized.
                      await _initializeControllerFuture;

                      // Attempt to take a picture and then get the location
                      // where the image file is saved.
                      final image = await _controller.takePicture();
                      // var cropped = await cropImage(image.path);
                      // if (cropped != '') {
                      // Get.back(result: {
                      //   'result': true,
                      //   // 'file': cropped,
                      //   'file': image.path,
                      // });
                      // }
                    } catch (e) {
                      // If an error occurs, log the error to the console.
                      // print(e);
                    }
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: AppTheme.primaryButtonBgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget toolbar() {
  //   return AuthAppbar(
  //     prefix: Align(
  //       alignment: Alignment.centerLeft,
  //       child: InkWell(
  //         onTap: () => Get.back(),
  //         child: Container(
  //           width: 36,
  //           height: 36,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(18),
  //             border: Border.all(color: Colors.white),
  //           ),
  //           child: const Center(
  //             child: Icon(
  //               Icons.arrow_back,
  //               size: 16,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     suffix: const Align(
  //       alignment: Alignment.centerRight,
  //       child: QuestionWidget(
  //         isWhite: true,
  //       ),
  //     ),
  //   );
  // }
}
