import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final void Function() onTap;
  final Widget? text1;
  final Widget? text2;
  final bool? divider;
  final bool? auto;
  final MainAxisAlignment? mainAxis;
  final double? paddingHorizontal;
  final double? paddingVertical;
  const RowText({
    super.key,
    required this.onTap,
    this.text1,
    this.text2,
    this.divider = true,
    this.auto = true,
    this.mainAxis = MainAxisAlignment.center,
    this.paddingHorizontal = 0,
    this.paddingVertical = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal ?? 0,
              vertical: paddingVertical ?? 0,
            ),
            color: Colors.white,
            child: auto == true
                ? Row(
                    children: [
                      Expanded(child: text1 ?? SizedBox()),
                      Expanded(child: text2 ?? SizedBox()),
                    ],
                  )
                : Row(
                    mainAxisAlignment: mainAxis ?? MainAxisAlignment.center,
                    children: [
                      text1 ?? SizedBox(),
                      text2 ?? SizedBox(),
                    ],
                  ),
          ),
          divider == true ? Divider() : SizedBox(),
        ],
      ),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  final void Function() onTap;
  final String? text;
  const MyOutlinedButton({super.key, required this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 54,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 2,
              color: Color(0xFF304FFE),
            ),
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text ?? "Button",
                style: TextStyle(
                  color: Color(0xFF304FFE),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  final void Function() onTap;
  final String? text;
  final Color? color;
  const MyElevatedButton({
    super.key,
    required this.onTap,
    this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Color(0xFF304FFE),
          ),
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text ?? "Button",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
