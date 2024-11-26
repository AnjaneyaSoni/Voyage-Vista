import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  PlaceCard({
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}