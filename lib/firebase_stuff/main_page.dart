import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homechef_v3/firebase_stuff/auth_page.dart';
import 'package:homechef_v3/screens/Login/loginpagecombined.dart';
import 'package:homechef_v3/screens/home/home_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const String routeName = '/mainpage';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => MainPage(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
