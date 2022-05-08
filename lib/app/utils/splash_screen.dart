import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplasScreen extends StatelessWidget {
  const SplasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 350,
            height: 350,
            child: Lottie.asset('assets/lottie/splashscreen.json'),
          ),
        ),
      ),
    );
  }
}
