import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

String firstName = '';

class _SignUpScreenState extends State<SignUpScreen> {
  String lastName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement sign-up logic here
                // You can add validation and store user data accordingly
                if (firstName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('First Name is required')),
                  );
                } else if (email.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Email is required')),
                  );
                } else if (password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password is required')),
                  );
                } else if (password.length < 8) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password must be at least 8 characters')),
                  );
                } else {
                  // Implement sign-up logic here
                  // You can add validation and store user data accordingly

                  Navigator.pop(context); // Go back to login after sign up
                }
              },
              child: Text('Sign Up'), // <--- This line is crucial. It specifies the button's child widget.
            ),
          ],
        ),
      ),
    );
  }
}
