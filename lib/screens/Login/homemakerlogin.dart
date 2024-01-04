import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomemakerLoginScreen extends StatefulWidget {
  // final VoidCallbackAction
  const HomemakerLoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/homemakerlogin';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomemakerLoginScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  State<HomemakerLoginScreen> createState() => _HomemakerLoginScreenState();
}

class _HomemakerLoginScreenState extends State<HomemakerLoginScreen> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/chefhat.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Hey there, Chef!',
                  style: GoogleFonts.caveat(fontSize: 54),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome back!',
                  style: GoogleFonts.diphylleia(fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //login button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: login,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        'Log in',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Colors.white,
                            ),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                //not a member,register

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Text(
                        ' Register now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//
// class HomemakerLoginScreen extends StatefulWidget {
//   const HomemakerLoginScreen({Key? key}) : super(key: key);
//   static const String routeName = '/homemakerlogin';
//
//   static Route route() {
//     return MaterialPageRoute(
//         builder: (_) => HomemakerLoginScreen(),
//         settings: RouteSettings(name: routeName));
//   }
//
//   @override
//   _HomemakerLoginScreenState createState() => _HomemakerLoginScreenState();
// }
//
// class _HomemakerLoginScreenState extends State<HomemakerLoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   Future<void> _login() async {
//     if (_emailController.text == '1' && _passwordController.text == '2') {
//       print("User logged in: ${_emailController.text}");
//       Navigator.pushNamed(context, '/');
//     } else {
//       print("Invalid credentials");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           automaticallyImplyLeading: false,
//           title: Text(
//             'Hey there, Chef',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Signika',
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             color: Colors.deepPurple,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   height: 50,
//                 ),
//                 TextField(
//                   style: TextStyle(color: Colors.white),
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     prefixIcon: Icon(Icons.email,
//                         color: Colors.white), // set icon color
//                     focusColor: Colors.deepPurple,
//                     labelStyle:
//                         TextStyle(color: Colors.white), // set label color
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.white), // set underline color
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.white), // set focused underline color
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   style: TextStyle(color: Colors.white),
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: Icon(Icons.email,
//                         color: Colors.white), // set icon color
//                     focusColor: Colors.deepPurple,
//                     labelStyle:
//                         TextStyle(color: Colors.white), // set label color
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.white), // set underline color
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.white), // set focused underline color
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 60),
//                 ElevatedButton(
//                   onPressed: _login,
//                   child: Text('Login'),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate to the signup page
//                     Navigator.pushNamed(context, '/homemakerregister');
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 55),
//                       Text(
//                         'Wanna join the community?',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(width: 4),
//                       const Text(
//                         'Apply Here',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }