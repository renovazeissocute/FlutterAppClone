import 'package:flutter/material.dart';
import 'package:soundcloud_clone/navigations/tabbar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay navigation by 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainTabBar()),  // Go to MainTabBar after 5 seconds
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // Set background color to black
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 100,  // Adjust this value to make the logo smaller (e.g., 100)
        ),
      ),
    );
  }
}
