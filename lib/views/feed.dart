import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late PageController _pageController;
  late List<VideoPlayerController> _videoControllers;

  // List of video assets and user data
  final List<Map<String, dynamic>> _videoData = [
    {
      'video': 'assets/videos/sample1.mp4',
      'user': {
        'name': 'Sabrina Carpenter',
        'profilePic': 'assets/profile/profile1.png', // Ensure this file exists
        'message': 'Sabrina Carpenter - Espresso', // Custom message above profile pic
      },
      'likes': 123, // Initial like count
      'isLiked': false, // Like state
    },
    {
      'video': 'assets/videos/sample2.mp4',
      'user': {
        'name': 'Lady Gaga',
        'profilePic': 'assets/profile/profile2.png', // Ensure this file exists
        'message': 'Lady Gaga, Bruno Mars - Die With A Smile', // Custom message above profile pic
      },
      'likes': 45, // Initial like count
      'isLiked': false, // Like state
    },
  ];

  // Track follow state for each user
  late List<bool> _isFollowing;
  bool _isDiscoverSelected = true; // Track selected tab

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _isFollowing = List.generate(_videoData.length, (index) => false); // Initialize following state

    // Initialize video controllers for each video asset
    _videoControllers = _videoData.map((data) {
      return VideoPlayerController.asset(data['video']);
    }).toList();

    // Initialize all controllers and set the first one to play
    initializeControllers();

    // Listen for page changes to handle video playback
    _pageController.addListener(() {
      final pageIndex = _pageController.page!.round();
      _handleVideoPlayback(pageIndex);
    });
  }

  Future<void> initializeControllers() async {
    for (var controller in _videoControllers) {
      await controller.initialize();
    }

    // Play the first video after all are initialized
    _videoControllers[0].play();
    setState(() {});
  }

  void _handleVideoPlayback(int index) {
    // Pause all videos except the one currently in view
    for (int i = 0; i < _videoControllers.length; i++) {
      if (i == index) {
        _videoControllers[i].play();
      } else {
        _videoControllers[i].pause();
      }
    }
  }

  void _toggleFollow(int index) {
    setState(() {
      _isFollowing[index] = !_isFollowing[index]; // Toggle follow state
    });
  }

  void _toggleLike(int index) {
    setState(() {
      _videoData[index]['isLiked'] = !_videoData[index]['isLiked']; // Toggle like state
      // Update like count based on the new like state
      if (_videoData[index]['isLiked']) {
        _videoData[index]['likes']++;
      } else {
        _videoData[index]['likes']--;
      }
    });
  }

  void _toggleTab() {
    setState(() {
      _isDiscoverSelected = !_isDiscoverSelected; // Toggle between Discover and Following
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _videoControllers.length,
        itemBuilder: (context, index) {
          return buildVideoPlayer(index);
        },
      ),
      // Add a top bar for Discover and Following
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: _toggleTab,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isDiscoverSelected ? Colors.grey : Colors.black, // Black for unselected
                foregroundColor: Colors.white, // Set text color
              ),
              child: Text(
                'Discover',
                style: TextStyle(
                  color: _isDiscoverSelected ? Colors.white : Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _toggleTab,
              style: ElevatedButton.styleFrom(
                backgroundColor: !_isDiscoverSelected ? Colors.grey : Colors.black, // Black for unselected
                foregroundColor: Colors.white, // Set text color
              ),
              child: Text(
                'Following',
                style: TextStyle(
                  color: !_isDiscoverSelected ? Colors.white : Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white), // Three-dot icon
            onPressed: () {
              // Handle menu action here
            },
          ),
        ],
      ),
    );
  }

  Widget buildVideoPlayer(int index) {
    final userData = _videoData[index]['user'];

    return Stack(
      children: [
        Center(
          child: _videoControllers[index].value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoControllers[index].value.aspectRatio,
                  child: VideoPlayer(_videoControllers[index]),
                )
              : const CircularProgressIndicator(),
        ),
        // User profile section below the video
        Positioned(
          bottom: 80, // Position it above the tab bar
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(10), // Add some padding for spacing
            decoration: BoxDecoration(
              color: Colors.grey[850], // Dark grey background
              borderRadius: BorderRadius.circular(10), // Rounded corners for the box
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userData['message'], // Display custom message above profile pic
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18, // Slightly larger size for the message
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
                const SizedBox(height: 5), // Small spacing between message and profile section
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(userData['profilePic']),
                    ),
                    const SizedBox(width: 8), // Small gap between profile picture and name
                    Expanded( // Wrap text in Expanded to prevent overflow
                      child: Text(
                        userData['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Regular size for the username
                        ),
                        overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                      ),
                    ),
                    const SizedBox(width: 5), // Reduced spacing
                    ElevatedButton(
                      onPressed: () => _toggleFollow(index), // Toggle follow action
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey, // Change to grey
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(70, 30), // Small button size
                      ),
                      child: Text(_isFollowing[index] ? 'Following' : 'Follow'), // Update text based on follow state
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Overlay controls on the right side
        Positioned(
          right: 20,
          bottom: 50,
          child: Column(
            children: [
              // Like Button
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      _videoData[index]['isLiked'] ? Icons.favorite : Icons.favorite_border,
                      color: _videoData[index]['isLiked'] ? Colors.white : Colors.grey,
                    ),
                    onPressed: () => _toggleLike(index),
                  ),
                  Text(
                    '${_videoData[index]['likes']}', // Display like count
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Spacing between buttons
              // Comment Button
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.comment, color: Colors.white),
                    onPressed: () {
                      // Handle comment action
                    },
                  ),
                  const Text(
                    '45', // Replace with dynamic comment count
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Spacing between buttons
              // Add Button
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      // Handle add action
                    },
                  ),
                  const Text(
                    'Add', // Text or icon for adding content
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
