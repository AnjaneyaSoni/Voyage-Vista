import 'package:flutter/material.dart';
import 'plantrip.dart'; // Import the plantrip.dart for navigation
import 'package:flutter/services.dart';

void main() {
  runApp(VoyageVistaApp());
}

class VoyageVistaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilterScreen(),
    );
  }
}

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _budget = 5000;
  final TextEditingController _numTravelersController = TextEditingController();

  Map<String, bool> _cities = {
    'Gandhinagar': false,
    'Ahmedabad': false,
    'Rajkot': false,
    'Porbandar': false,
    'Jamnagar': false,
    'Dwarka': false,
  };

  Map<String, bool> _travelerGroups = {
    'Adults': false,
    'Teenagers': false,
    'Picnic students': false,
    'Family': false,
  };

  // List to store favorite cities
  List<String> _favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Budget Slider
                Text(
                  'Budget',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Slider(
                  value: _budget,
                  min: 1000,
                  max: 10000,
                  divisions: 18,
                  label: _budget.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _budget = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1000'),
                    Text('10000'),
                  ],
                ),
                SizedBox(height: 20),

                // Cities Filter
                Text(
                  'City',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Column(
                  children: _cities.keys.map((String city) {
                    return CheckboxListTile(
                      title: Text(city),
                      value: _cities[city],
                      onChanged: (bool? value) {
                        setState(() {
                          _cities[city] = value ?? false;
                          if (value == true) {
                            _favorites.add(city);
                          } else {
                            _favorites.remove(city);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),

                // Traveler Groups Filter
                Text(
                  'Travelers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Column(
                  children: _travelerGroups.keys.map((String group) {
                    return CheckboxListTile(
                      title: Text(group),
                      value: _travelerGroups[group],
                      onChanged: (bool? value) {
                        setState(() {
                          _travelerGroups[group] = value ?? false;
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),

                // Number of Travelers Filter (TextField for number input)
                Text(
                  'Number of Travelers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _numTravelersController,
                  keyboardType: TextInputType.number, // Opens number keypad
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter number of travelers',
                    labelText: 'Travelers',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Allows only digits
                  ],
                ),
                SizedBox(height: 29),

                // "Plan My Trip" Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the FavoritesScreen when "Plan My Trip" is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(),
                        ),
                      );
                    },
                    child: Text('Plan My Trip'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      backgroundColor: Colors.blueAccent, // Corrected the 'primary' issue
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
