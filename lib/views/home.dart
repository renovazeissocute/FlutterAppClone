import 'package:flutter/material.dart';
import 'package:soundcloud_clone/inbox.dart';
import 'package:soundcloud_clone/notifications.dart'; // Import the notifications screen
import 'package:soundcloud_clone/views/album_view.dart'; // Import AlbumViewScreen
import 'package:soundcloud_clone/views/upgrade.dart'; // Import Upgrade screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List to keep track of the follow status for each artist
  List<bool> _isFollowing = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // "GET PRO" Text Button
          GestureDetector(
            onTap: () {
              // Navigate to Upgrade screen when "GET PRO" is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpgradeScreen()),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8), // Margin for spacing
              child: Text(
                'GET PRO',
                style: TextStyle(color: Colors.orange, fontSize: 16), // Orange color for the text
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.screen_share_outlined, color: Colors.grey),
            onPressed: () {
              // Add your upload action here
            },
          ),
          IconButton(
            icon: Icon(Icons.upload_outlined, color: Colors.grey),
            onPressed: () {
              // Add your upload action here
            },
          ),
          IconButton(
            icon: Icon(Icons.email_outlined, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InboxScreen()),
              ); // Navigate to InboxScreen
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              ); // Navigate to NotificationsScreen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle('More of what you like'),
              horizontalPlaylistList([
                buildPlaylist('Season - Wave to Earth', 'assets/mix/mix6.jpg'),
                buildPlaylist('If It\'s Not You - PRYVT', 'assets/mix/mix5.jpg'),
                buildPlaylist('Oh It\'s You - Babychair', 'assets/mix/mix4.jpg'),
                buildPlaylist('Pasilyo - Sunkissed Lola', 'assets/mix/mix3.jpg'),
                buildPlaylist('Say - Keshi', 'assets/mix/mix2.jpg'),
                buildPlaylist('Die with a Smile - Lady Gaga, Bruno Mars', 'assets/mix/mix1.jpg'),
              ]),
              sectionTitle('Mixed for 🌍'),
              horizontalPlaylistList([
                buildPlaylist('Your Mix 1', 'assets/mix/mix1.jpg'),
                buildPlaylist('Your Mix 2', 'assets/mix/mix2.jpg'),
                buildPlaylist('Your Mix 3', 'assets/mix/mix3.jpg'),
                buildPlaylist('Your Mix 4', 'assets/mix/mix4.jpg'),
                buildPlaylist('Your Mix 5', 'assets/mix/mix5.jpg'),
                buildPlaylist('Your Mix 6', 'assets/mix/mix6.jpg'),
              ]),
              sectionTitle('Made for 🌍'),
              horizontalPlaylistList([
                buildPlaylist('Daily Drops', 'assets/mix/mix6.jpg'),
                buildPlaylist('Weekly Wave', 'assets/mix/mix5.jpg'),
                buildPlaylist('Dramiser', 'assets/mix/mix4.jpg'),
                buildPlaylist('New Releases', 'assets/mix/mix3.jpg'),
                buildPlaylist('Chill Vibes', 'assets/mix/mix2.jpg'),
                buildPlaylist('Top Hits', 'assets/mix/mix1.jpg'),
              ]),
              sectionTitle('Introducing Buzzing'),
              horizontalPlaylistList([
                buildPlaylist('Buzzing Electro', 'assets/mix/mix6.jpg'),
                buildPlaylist('Buzzing Pop', 'assets/mix/mix5.jpg'),
                buildPlaylist('Buzzing Metal', 'assets/mix/mix4.jpg'),
                buildPlaylist('Buzzing Hip Hop', 'assets/mix/mix3.jpg'),
                buildPlaylist('Buzzing Indie', 'assets/mix/mix2.jpg'),
                buildPlaylist('Buzzing R&B', 'assets/mix/mix1.jpg'),
              ]),
              sectionTitle('Artists you should follow'),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Based on your listening history',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              Container(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, index) => SizedBox(width: 40), // Increased space between profiles
                  itemBuilder: (context, index) {
                    return buildArtist(
                      ['Sabrina Carpenter', 'Lady Gaga', 'Wave to Earth', 'Billie Eilish', 'Keshi'][index],
                      'assets/profile/profile${index + 1}.png',
                      index,
                    );
                  },
                ),
              ),
              SizedBox(height: 20), // Space between the artists section and tab bar
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget horizontalPlaylistList(List<Widget> playlists) {
    return Container(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: playlists.length,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemBuilder: (context, index) {
          return playlists[index];
        },
      ),
    );
  }

  Widget buildPlaylist(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate to AlbumViewScreen when playlist is clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumViewScreen(
              title: title, // Pass the playlist title
              imagePath: imagePath, // Pass the playlist image path
            ),
          ),
        );
      },
      child: Container(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildArtist(String name, String imagePath, int index) {
    return Container(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 40, // Increased the radius for a bigger image
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 8),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // Add ellipsis for long names
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isFollowing[index] = !_isFollowing[index]; // Toggle the follow state
              });
            },
            child: Text(_isFollowing[index] ? 'Following' : 'Follow'), // Change button text based on state
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust padding for button
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
