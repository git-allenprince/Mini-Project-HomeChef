import 'package:flutter/material.dart';

class PlateScreen extends StatelessWidget {
  static const String routeName = '/plate';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => PlateScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plate')),
    );
  }
}
