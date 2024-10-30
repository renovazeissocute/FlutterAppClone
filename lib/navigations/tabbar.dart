import 'package:flutter/material.dart';
import 'package:soundcloud_clone/views/feed.dart';
import 'package:soundcloud_clone/views/home.dart';
import 'package:soundcloud_clone/views/library.dart';
import 'package:soundcloud_clone/views/search.dart';
import 'package:soundcloud_clone/views/upgrade.dart';

class MainTabBar extends StatefulWidget {
  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  int _currentIndex = 0;

  // List of the screens you want to navigate between
  final List<Widget> _children = [
    HomeScreen(),     // Home Screen
    FeedScreen(),     // Feed Screen
    SearchScreen(),   // Search Screen
    LibraryScreen(),  // Library Screen
    UpgradeScreen(),  // Upgrade Screen
  ];

  // Function to change the index when a tab is clicked
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;  // Change the current index to the clicked tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // Set the background color for the scaffold
      body: _children[_currentIndex],  // Show the selected screen
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,  // When a tab is tapped, call the function
        currentIndex: _currentIndex,  // Reflect the current active tab
        backgroundColor: Colors.grey[900],  // Dark grey tab bar background color
        unselectedItemColor: Colors.grey,  // Grey for unselected icons
        selectedItemColor: Colors.white,  // White for the selected icon
        type: BottomNavigationBarType.fixed,  // Always show labels
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}