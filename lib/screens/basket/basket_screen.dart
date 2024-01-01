import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);
  static const String routeName='/basket';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>BasketScreen(),settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Basket')),
      body: Center(
        child: ElevatedButton(
          child: Text('Location Screen'),
          onPressed: (){
            Navigator.pushNamed(context,'/location');
          },
        ),
      ),);
  }
}