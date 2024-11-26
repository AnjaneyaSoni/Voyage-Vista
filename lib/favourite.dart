import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favorites; // List of favorite places

  FavoritesScreen({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? Center(child: Text('No favorites added yet!')) // Message when no favorites
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favorites[index]),
            leading: Icon(Icons.favorite, color: Colors.red),
          );
        },
      ),
    );
  }
}