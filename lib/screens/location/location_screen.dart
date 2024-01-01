import 'package:flutter/material.dart';
import 'package:homechef_v3/models/price_model.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LocationScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Location')),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  // fontFamily:
                ),
              ),
              CustomPriceFilter(prices: Price.prices)
            ],
          ),
        ));
  }
}

class CustomPriceFilter extends StatelessWidget {
  final List<Price> prices;

  const CustomPriceFilter({
    Key? key,
    required this.prices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: prices
            .map((price) => Container(
                  child: Text(price.price),
                ))
            .toList());
  }
}
