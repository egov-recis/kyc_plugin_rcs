import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_screen.dart';
import 'landing_page_screen.dart';

class VerificationScreen extends StatefulWidget {
  final void Function() onFinish;
  const VerificationScreen({super.key, required this.onFinish});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var pageNum = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Verification"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 4,
            child: LinearProgressIndicator(
              value: (1 / 2) * pageNum,
              minHeight: 16,
              color: Color(0xFF304FFE),
              backgroundColor: Colors.white,
            ),
          ),
          Expanded(
            child: pageNum == 1
                ? tab1()
                : pageNum == 2
                    ? tab2()
                    : SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget tab2() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Image.asset(
                "assets/images/intro_0.png",
                scale: 4,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "Scan ID document to verify your identity",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "Confirm your identity with just a few taps on your phone.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPageScreen(
                      onFinish: widget.onFinish,
                      listStatus: [
                        3,
                        3,
                        2,
                      ],
                      nextPage: SizedBox(),
                      autoNextPage: false,
                      doFinish: true,
                    ),
                  ),
                );
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF304FFE),
                ),
                child: Icon(
                  Icons.filter_center_focus,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Scan",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget tab1() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Image.asset(
                "assets/images/intro_0.png",
                scale: 4,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "Take selfie to verify your identity",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "Quick and easy identification verification using your phone's camera. Confirm your identity with a self-captured photo.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () async {
                // final cameras = await availableCameras();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CameraScreen(
                //       type: '',
                //       camera: cameras.firstWhere(
                //         (element) =>
                //             element.lensDirection == CameraLensDirection.front,
                //       ),
                //     ),
                //   ),
                // );
                setState(() {
                  pageNum = 2;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LandingPageScreen(
                        onFinish: widget.onFinish,
                        listStatus: [
                          3,
                          2,
                          1,
                        ],
                        nextPage: SizedBox(),
                        autoNextPage: false,
                      ),
                    ),
                  );
                });
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF304FFE),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Take a selfie",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
