import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  final String title;

  PlaceDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details about $title will be shown here.'),
      ),
    );
  }
}