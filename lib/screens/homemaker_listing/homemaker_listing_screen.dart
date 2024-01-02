import 'package:flutter/material.dart';
import 'package:homechef_v3/widgets/homemaker_card.dart';

import '../../models/homemaker_model.dart';

class HomemakerListingScreen extends StatelessWidget {
  const HomemakerListingScreen({Key? key, required this.homemakers})
      : super(key: key);
  static const String routeName = '/homemaker-listing';

  static Route route({required List<Homemaker> homemakers}) {
    return MaterialPageRoute(
        builder: (_) => HomemakerListingScreen(homemakers: homemakers),
        settings: RouteSettings(name: routeName));
  }

  final List<Homemaker> homemakers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RestaurantListing')),
      body: ListView.builder(
        itemCount: homemakers.length,
        itemBuilder: (context, index) {
          return HomemakerCard(homemaker: homemakers[index]);
        },
      ),
    );
  }
}
