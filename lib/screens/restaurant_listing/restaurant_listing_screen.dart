import 'package:flutter/material.dart';

class RestaurantListingScreen extends StatelessWidget {
  const RestaurantListingScreen({Key? key}) : super(key: key);
  static const String routeName='/restaurant-listing';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>RestaurantListingScreen(),settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('RestaurantListing')),
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