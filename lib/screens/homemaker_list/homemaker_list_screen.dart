import 'package:flutter/material.dart';

class HomemakerListScreen extends StatelessWidget {
  static const String routeName = '/homemakerlist';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomemakerListScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homemaker List')),
    );
  }
}
