import 'dart:async';
import 'package:flutter/material.dart';

class HomemakerLoginScreen extends StatefulWidget {
  const HomemakerLoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/homemakerlogin';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomemakerLoginScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  _HomemakerLoginScreenState createState() => _HomemakerLoginScreenState();
}

class _HomemakerLoginScreenState extends State<HomemakerLoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    if (_usernameController.text == '1' && _passwordController.text == '2') {
      print("User logged in: ${_usernameController.text}");
      Navigator.pushNamed(context, '/');
    } else {
      print("Invalid credentials");
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          automaticallyImplyLeading: false,
          title: Text(
            'Hey there, Chef',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Signika',
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.email,
                        color: Colors.white), // set icon color
                    focusColor: Colors.deepPurple,
                    labelStyle:
                        TextStyle(color: Colors.white), // set label color
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // set underline color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // set focused underline color
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon:
                        Icon(Icons.lock, color: Colors.white), // set icon color
                    focusColor: Colors.deepPurple,
                    labelStyle:
                        TextStyle(color: Colors.white), // set label color
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // set underline color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // set focused underline color
                    ),
                  ),
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the signup page
                    Navigator.pushNamed(context, '/homemakerregister');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 55),
                      Text(
                        'Wanna join the community?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Apply Here',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
