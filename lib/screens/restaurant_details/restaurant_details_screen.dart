import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({Key? key}) : super(key: key);
  static const String routeName='/restaurant-details';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>RestaurantDetailsScreen(),settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('RestaurantDetails')),
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