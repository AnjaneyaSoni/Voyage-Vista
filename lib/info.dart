import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelDetailScreen(),
    );
  }
}

class TravelDetailScreen extends StatefulWidget {
  @override
  _TravelDetailScreenState createState() => _TravelDetailScreenState();
}

class _TravelDetailScreenState extends State<TravelDetailScreen> {
  bool isLiked = false; // This will track if the button is liked or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image from Google with back and favorite button
            Stack(
              children: [
                // Image from URL
                Container(
                  height: 350,
                  width: double.infinity,
                  child: Image.network(
                    'https://www.inidesignstudio.com/wp-content/uploads/2022/12/Render_cam_1-2048x1152.jpg', // Replace with Google image URL
                    fit: BoxFit.cover,
                  ),
                ),
                // Back button
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                // Like button with state
                Positioned(
                  top: 40,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked; // Toggle the like state
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border, // Toggle icon
                        color: isLiked ? Colors.red : Colors.black, // Toggle color
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Title, price, location, and reviews
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Place name',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
//                       Text(
//                         '\$980 / person',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black87,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Location and Reviews
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.redAccent),
                      SizedBox(width: 4),
                      Text('Pace location'),
                      SizedBox(width: 16),
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(' (1.7k reviews)', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),

            // Tabs for Overview, Details, Costs, Reviews
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DefaultTabController(
                length: 4,
                child: TabBar(
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelPadding: EdgeInsets.symmetric(horizontal: 16),
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Overview'),
                    Tab(text: 'Details'),
                    Tab(text: 'Costs'),
                    Tab(text: 'Reviews'),
                  ],
                ),
              ),
            ),

            // Description Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'INFORMATION ABOUT THIS PLACE',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}