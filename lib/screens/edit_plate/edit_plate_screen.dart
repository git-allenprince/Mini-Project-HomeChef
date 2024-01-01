import 'package:flutter/material.dart';

class EditPlateScreen extends StatelessWidget {
  static const String routeName = '/editplate';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => EditPlateScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Plate')),
    );
  }
}
