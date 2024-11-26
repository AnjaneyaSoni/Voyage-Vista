import 'package:flutter/material.dart';
import 'home1.dart'; // Make sure to import HomeScreen

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: Column(
        children: [
          // Upper Two-Thirds Image
          Container(
            height: MediaQuery.of(context).size.height * (2 / 3), // Take two-thirds of the screen height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1719139962223-f62b591aee2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3VqYXJhdCUyMHRvdXJpc218ZW58MHx8MHx8fDA%3D'), // Load image from the network
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Lower One-Third Text and Button
          Expanded(
            child: SingleChildScrollView( // Added scroll view to avoid overflow
              padding: const EdgeInsets.all(20.0), // Add padding to the content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Discover Your Next Adventure',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Explore breathtaking destinations, find hidden gems, and plan unforgettable journeys. Start your adventure today!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to HomeScreen when button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Teal button color
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // White text for the button
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
