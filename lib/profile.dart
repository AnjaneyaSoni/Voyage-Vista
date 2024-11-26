import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
      // Define routes for navigation
      routes: {
        '/login1': (context) => LoginPage(), // Define LoginPage separately
        '/signup': (context) => SignUpPage(), // Define SignUpPage separately
      },
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // User information (initial values can be empty)
  String name = '';
  String username = '';
  String email = '';
  String phone = '';
  String birthdate = '';
  String gender = '';
  int age = 0;
  String profilePicUrl = '';

  // Controllers to manage the user input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  int _rating = 0; // Rating stars count

  // Function to log out and redirect to login page (login1.dart)
  void _logOut() {
    Navigator.pushReplacementNamed(context, '/login1');
  }

  // Function to sign up (redirect to signup.dart)
  void _signUp() {
    Navigator.pushNamed(context, '/signup');
  }

  // Function to upload a profile picture (currently static for this example)
  void _setProfileImage() {
    setState(() {
      profilePicUrl =
      'https://via.placeholder.com/150'; // Dummy image URL (replace with image picker later)
    });
  }

  // Function to save user details
  void _saveDetails() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        name = nameController.text;
        username = usernameController.text;
        email = emailController.text;
        phone = phoneController.text;
        birthdate = birthdateController.text;
        gender = gender.isNotEmpty ? gender : 'Not specified';
        age = int.tryParse(ageController.text) ?? 0;
      });
      // You can add additional logic to save the details to a database or API here.
    }
  }

  // Function to select birthdate
  Future<void> _selectBirthdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        birthdate = "${picked.toLocal()}".split(' ')[0]; // Format to YYYY-MM-DD
        birthdateController.text = birthdate; // Update the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: _setProfileImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: profilePicUrl.isEmpty
                      ? AssetImage('assets/profile_placeholder.png')
                      : NetworkImage(profilePicUrl) as ImageProvider,
                ),
              ),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField('Name', nameController),
                  _buildTextField('Username', usernameController),
                  _buildTextField('Email ID', emailController),
                  _buildTextField('Age', ageController, isNumber: true),
                  _buildGenderDropdown(),
                  _buildTextField('Phone Number', phoneController, isNumber: true),
                  _buildDateField(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveDetails,
                    child: Text('Save Details'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  SizedBox(height: 20),
                  _buildRatingSection(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _logOut,
                    child: Text('Logout'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _signUp,
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: birthdateController,
        decoration: InputDecoration(
          labelText: 'Birthdate',
          border: OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () => _selectBirthdate(context),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your birthdate';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(),
        ),
        value: gender.isEmpty ? null : gender,
        items: ['Male', 'Female', 'Other'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            gender = value ?? '';
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your gender';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rate us:', style: TextStyle(fontSize: 18)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < _rating ? Icons.star : Icons.star_border,
                color: Colors.orange,
              ),
              onPressed: () {
                setState(() {
                  _rating = index + 1;
                });
              },
            );
          }),
        ),
      ],
    );
  }
}

// Dummy LoginPage Widget
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login Page'), // Add your login logic here
      ),
    );
  }
}

// Dummy SignUpPage Widget
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Text('Sign Up Page'), // Add your sign-up logic here
      ),
    );
  }
}