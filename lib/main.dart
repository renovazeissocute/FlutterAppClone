import 'package:flutter/material.dart';
import 'package:soundcloud_clone/splash_screen.dart';  // Make sure you import your splash screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),  // Set SplashScreen as the first screen
    );
  }
}
