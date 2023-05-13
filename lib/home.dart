import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'config.dart';
import 'homeview.dart';

class Splash extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: MyHomePage(),
      backgroundColor: primaryColor,
      title: const Text(
        'مرحبا بكم في تطبيق الأذكار',
        // ignore: prefer_const_constructors
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
      ),
      loaderColor: Colors.red,
    );
  }
}
