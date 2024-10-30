import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isSearching = false; // Track whether the user is typing in the search box
  String searchQuery = ''; // Store the user's search query

  // List of available artists (for demonstration purposes)
  final List<Map<String, dynamic>> artists = [
    {'name': 'Sabrina Carpenter', 'image': 'assets/profile/profile1.png', 'isFollowing': false},
    {'name': 'Keshi', 'image': 'assets/profile/profile5.png', 'isFollowing': false},
    {'name': 'wave to earth', 'image': 'assets/profile/profile3.png', 'isFollowing': false},
    {'name': 'Billie Eilish', 'image': 'assets/profile/profile4.png', 'isFollowing': false},
    {'name': 'lady gaga', 'image': 'assets/profile/profile2.png', 'isFollowing': false},
  ];

  // Filter artists based on the search query
  List<Map<String, dynamic>> get filteredArtists {
    return artists
        .where((artist) => artist['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                            _isSearching = value.isNotEmpty; // Hide genres when typing
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Show search results when typing
              if (_isSearching) ...[
                if (filteredArtists.isEmpty) // No results found
                  Center(
                    child: Text(
                      'No artists found',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filteredArtists.length,
                    itemBuilder: (context, index) {
                      final artist = filteredArtists[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(artist['image']!),
                              radius: 30,
                            ),
                            title: Text(
                              artist['name']!,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  artist['isFollowing'] = !artist['isFollowing'];
                                });
                              },
                              child: Text(
                                artist['isFollowing'] ? 'Following' : 'Follow',
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: artist['isFollowing'] ? Colors.black : Colors.white,
                                foregroundColor: artist['isFollowing'] ? Colors.white : Colors.black,
                                side: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 20), // Add gap between artist entries
                        ],
                      );
                    },
                  ),
              ],

              // Only show genres if not typing
              if (!_isSearching) ...[
                // Grid of genres
                GridView.count(
                  crossAxisCount: 2, // 2 genres per row
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildGenre('assets/genres/rock.jpg', 'Rock'),
                    buildGenre('assets/genres/pop.jpg', 'Pop'),
                    buildGenre('assets/genres/jazz.jpg', 'Jazz'),
                    buildGenre('assets/genres/hiphop.jpg', 'Hip Hop'),
                    buildGenre('assets/genres/electronic.jpg', 'Electronic'),
                    buildGenre('assets/genres/classical.jpg', 'Classical'),
                    buildGenre('assets/genres/country.jpg', 'Country'),
                    buildGenre('assets/genres/reggae.jpg', 'Reggae'),
                    buildGenre('assets/genres/blues.jpg', 'Blues'),
                    buildGenre('assets/genres/metal.jpg', 'Metal'),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGenre(String imagePath, String genre) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          genre,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18, // Adjust size to make it more readable
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0), // Shadow position
                blurRadius: 4.0, // Make the shadow softer
                color: Colors.black.withOpacity(0.6), // Shadow color for contrast
              ),
            ],
          ),
        ),
      ),
    );
  }
}
