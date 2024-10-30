import 'package:flutter/material.dart';
import 'package:soundcloud_clone/views/upgrade.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Library',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpgradeScreen()),
              );
            },
            child: const Text(
              'GET PRO',
              style: TextStyle(color: Colors.orange),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.grey),
            onPressed: () {
              // Navigate to settings
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.grey),
            onPressed: () {
              // Navigate to profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMenuItem('Liked tracks', Icons.arrow_forward_ios),
            _buildMenuItem('Playlists', Icons.arrow_forward_ios),
            _buildMenuItem('Albums', Icons.arrow_forward_ios),
            _buildMenuItem('Following', Icons.arrow_forward_ios),
            _buildMenuItem('Stations', Icons.arrow_forward_ios),
            const SizedBox(height: 20),

            // Recently played section with closer spacing
            _buildSectionTitle('Recently played'),
            const SizedBox(height: 8), // Adjusted spacing
            _buildRecentlyPlayedItem(),

            // Add more spacing above Listening history
            const SizedBox(height: 30), // Increased spacing
            _buildSectionTitleWithSeeAll('Listening history'), // Updated section title with "See All" button on the same row
            const SizedBox(height: 10),

            // Listening history items
            _buildListeningHistoryItem(), // First item
            const SizedBox(height: 10), // Add some space between items
            _buildListeningHistoryItem2(), // Second item
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Icon(icon, color: Colors.grey, size: 16),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionTitleWithSeeAll(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              // Add navigation to "See All" functionality
            },
            child: const Text(
              'See All',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyPlayedItem() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/tracks/track1.jpg'), // Replace with your asset path
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vampire - Olivia Rodrigo',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              'Related tracks: ...',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'SoundCloud',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListeningHistoryItem() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/tracks/track2.jpg'), // Replace with your asset path
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track1',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  'Adoomy',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 8),
                Text(
                  '537K • 4:56',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.grey),
          onPressed: () {
            // Add functionality for more options
          },
        ),
      ],
    );
  }

  Widget _buildListeningHistoryItem2() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/tracks/track3.jpg'), // Replace with your asset path
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track2',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  'The Weeknd',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 8),
                Text(
                  '1.2M • 3:20',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.grey),
          onPressed: () {
            // Add functionality for more options
          },
        ),
      ],
    );
  }
}
