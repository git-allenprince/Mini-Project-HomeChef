import 'package:flutter/material.dart';
import 'package:homechef_v3/models/category_model.dart';
import 'package:homechef_v3/models/homemaker_model.dart';
import 'package:homechef_v3/screens/homemaker_listing/homemaker_listing_screen.dart';


class CategoryBox extends StatelessWidget {
  final Category category;

  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        List<Homemaker> filteredHomemakers = Homemaker.homemakers
            .where((homemaker) =>
            homemaker.menuItems.any((menuItem) =>
            menuItem.name.toLowerCase() ==
                category.name.toLowerCase()))
            .toList();
        Navigator.pushNamed(
          context,
          HomemakerListingScreen.routeName,
          arguments: filteredHomemakers,
        );
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.deepPurple, width: 2),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -10,
              left: 5,
              child: Container(
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: category.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  category.name, style: TextStyle(fontWeight:FontWeight.bold),
                  // Modify text styling as needed
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
