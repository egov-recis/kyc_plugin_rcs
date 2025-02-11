import 'dart:async';

import 'package:flutter/material.dart';

class LandingPageScreen extends StatefulWidget {
  final void Function() onFinish;
  final List<int> listStatus;
  final Widget nextPage;
  final bool? autoNextPage;
  final bool? doFinish;
  const LandingPageScreen({
    super.key,
    required this.onFinish,
    required this.listStatus,
    required this.nextPage,
    this.autoNextPage = true,
    this.doFinish,
  });

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  List<String> listText = [
    "Phone verified",
    "Checking up document ID",
    "Verifying photo",
  ];
  // 1: Not yet | 2: Loading | 3: Success

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
      if (widget.autoNextPage == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.nextPage),
        );
      } else if (widget.doFinish == true) {
        widget.onFinish();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: AppBar().preferredSize.height,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/intro_0.png",
              scale: 4,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 40),
            Text(
              "Setting up\nyour account",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "We are analyzing your data to verify",
              style: TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ListView.builder(
              itemBuilder: (context, index) => itemLanding(
                index: index,
                text: listText[index],
                status: widget.listStatus[index],
                divider: index == 2 ? false : true,
              ),
              itemCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget itemLanding({
    required int index,
    required String text,
    required int status,
    bool? divider = true,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(child: Text((index + 1).toString())),
              ),
              SizedBox(width: 8),
              Expanded(child: Text(text)),
              SizedBox(width: 8),
              status == 3
                  ? Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFF304FFE),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    )
                  : status == 2
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Color(0xFF304FFE),
                            strokeWidth: 2,
                          ),
                        )
                      : SizedBox(),
            ],
          ),
        ),
        divider == true ? Divider() : SizedBox(),
      ],
    );
  }
}
