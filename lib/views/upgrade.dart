import 'package:flutter/material.dart';

class UpgradeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white), // 'X' icon
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Adjust the path to your image
              width: 200, // Adjust size as needed
            ),
            const SizedBox(height: 20), // More gap between image and messages
            const Text(
              'Unlock artist tools & unlimited uploads',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22, // Make the message bigger
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5), // Small gap
            Text(
              'For THB 700.00, billed monthly',
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 5), // Small gap
            const Text(
              'Cancel any time. Restrictions apply',
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 20), // Gap between messages and button
            ElevatedButton(
              onPressed: () {
                // Add your action for the button here
              },
              child: const Text('Get Next Pro', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // White background for the button
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Adjust padding
              ),
            ),
            const SizedBox(height: 20), // Gap between button and 'See all plans'
            GestureDetector(
              onTap: () {
                // Add your action for 'See all plans' here
              },
              child: const Text(
                'See all plans',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
