// inbox.dart
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Set back arrow color to white
      ),
      body: const Center(
        child: const Text(
          'No new messages',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
