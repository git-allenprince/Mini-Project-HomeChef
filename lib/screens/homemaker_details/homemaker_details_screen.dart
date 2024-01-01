import 'package:flutter/material.dart';

class HomemakerDetailsScreen extends StatelessWidget {
  static const String routeName = '/homemakerdetails';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomemakerDetailsScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homemaker Details')),
    );
  }
}
