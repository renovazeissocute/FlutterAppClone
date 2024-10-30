import 'package:flutter/material.dart';
import 'package:soundcloud_clone/track.dart'; // Import the Track class

class AlbumViewScreen extends StatefulWidget {
  final String title;
  final String imagePath;

  AlbumViewScreen({required this.title, required this.imagePath});

  @override
  _AlbumViewScreenState createState() => _AlbumViewScreenState();
}

class _AlbumViewScreenState extends State<AlbumViewScreen> {
  int likeCount = 0; // Initial like count
  bool isLiked = false; // Track if the playlist is liked

  final List<Track> tracks = [
    Track(
      title: 'Track 1',
      artist: 'Artist 1',
      duration: '3:45',
      imagePath: 'assets/tracks/track1.jpg',
    ),
    Track(
      title: 'Track 2',
      artist: 'Artist 2',
      duration: '4:12',
      imagePath: 'assets/tracks/track2.jpg',
    ),
    Track(
      title: 'Track 3',
      artist: 'Artist 3',
      duration: '2:56',
      imagePath: 'assets/tracks/track3.jpg',
    ),
    Track(
      title: 'Track 4',
      artist: 'Artist 4',
      duration: '2:56',
      imagePath: 'assets/tracks/track4.jpg',
    ),
    Track(
      title: 'Track 5',
      artist: 'Artist 5',
      duration: '2:56',
      imagePath: 'assets/tracks/track5.jpg',
    ),
    // Add more tracks as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Album details with like, menu, shuffle, and play buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align image and text to the left
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Playlist image
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(widget.imagePath), // Use album image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      // Playlist title and track info
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Playlist • ${tracks.length} Tracks',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Row of action buttons placed under the image
                  Row(
                    children: [
                      // Like button with like count
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.orange : Colors.white,
                              size: 24, // Smaller size
                            ),
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked; // Toggle like status
                                if (isLiked) {
                                  likeCount++; // Increment like count
                                } else {
                                  likeCount--; // Decrement like count
                                }
                              });
                            },
                          ),
                          Text(
                            '$likeCount', // Display like count
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: 16), // Space between buttons
                      IconButton(
                        icon: Icon(Icons.more_vert, color: Colors.white, size: 24), // Smaller size
                        onPressed: () {
                          // Handle more options action
                        },
                      ),
                      Spacer(), // Take up remaining space between the groups of buttons
                      // Last two buttons (shuffle and play)
                      IconButton(
                        icon: Icon(Icons.shuffle, color: Colors.white, size: 24), // Smaller size
                        onPressed: () {
                          // Handle shuffle action
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle play action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(8), // Smaller button
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 24, // Smaller play icon
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey),
            // Track list
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tracks.length,
              separatorBuilder: (context, index) => Divider(color: Colors.grey),
              itemBuilder: (context, index) {
                final track = tracks[index];
                return ListTile(
                  leading: Image.asset(
                    track.imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    track.title,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '${track.artist} • ${track.duration}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(Icons.more_vert, color: Colors.white),
                  onTap: () {
                    // Add action to play track or view details
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
