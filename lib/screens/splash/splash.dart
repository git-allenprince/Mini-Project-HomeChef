import 'package:flutter/material.dart';
import 'package:homechef_v3/firebase_stuff/main_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => SplashScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome(context);
  }

  _navigateToHome(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset(
             'assets/logo.png',
            height: 300,
          ),
        ),
      ),
    );
  }
}
