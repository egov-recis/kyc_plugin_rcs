import 'package:flutter/material.dart';
import 'package:kyc_plugin_rcs/kyc_rcs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KycRcsScreen(
        onFinish: () {},
      ),
    );
  }
}
