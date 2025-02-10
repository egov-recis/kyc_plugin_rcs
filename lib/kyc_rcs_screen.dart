import 'package:flutter/material.dart';

class KycRcsScreen extends StatefulWidget {
  final void Function() onFinish;
  const KycRcsScreen({super.key, required this.onFinish});

  @override
  State<KycRcsScreen> createState() => _KycRcsScreenState();
}

class _KycRcsScreenState extends State<KycRcsScreen> {
  final imageAssets = [
    "assets/images/intro_0.png",
    "assets/images/intro_1.png",
    "assets/images/intro_2.png",
  ];
  final texts = [
    "Trusted by millions of people, part of one part",
    "Spend money abroad, and track your expense",
    "Receive Money From Anywhere In The World",
  ];

  var pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
              ) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Center(
                key: ValueKey<int>(pageNum),
                child: Image.asset(
                  imageAssets[pageNum],
                  scale: 4,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSize(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOutCirc,
                      child: GestureDetector(
                        onTap: () {
                          if (pageNum != 0) {
                            setState(() {
                              pageNum = 0;
                            });
                          }
                        },
                        child: Container(
                          height: 12,
                          width: pageNum == 0 ? 20 : 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: pageNum == 0
                                ? Color(0xFF304FFE)
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    AnimatedSize(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOutCirc,
                      child: GestureDetector(
                        onTap: () {
                          if (pageNum != 1) {
                            setState(() {
                              pageNum = 1;
                            });
                          }
                        },
                        child: Container(
                          height: 12,
                          width: pageNum == 1 ? 20 : 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: pageNum == 1
                                ? Color(0xFF304FFE)
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    AnimatedSize(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOutCirc,
                      child: GestureDetector(
                        onTap: () {
                          if (pageNum != 2) {
                            setState(() {
                              pageNum = 2;
                            });
                          }
                        },
                        child: Container(
                          height: 12,
                          width: pageNum == 2 ? 20 : 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: pageNum == 2
                                ? Color(0xFF304FFE)
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: Padding(
                    key: ValueKey<int>(pageNum),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      texts[pageNum],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 24,
                    left: 20,
                    right: 20,
                  ),
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF304FFE),
                      ),
                      onPressed: () {
                        setState(() {
                          if (pageNum == 2) {
                            widget.onFinish();
                          } else {
                            pageNum++;
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
