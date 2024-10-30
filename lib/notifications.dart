// notifications.dart
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Set back arrow color to white
      ),
      body: const Center(
        child: Text(
          'You have no notifications',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
