import 'package:flutter/material.dart';
import 'package:homechef_v3/models/models.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Homemaker> homemakers = Homemaker.homemakers
        .where(
          (homemaker) => homemaker.menuItems.contains(category.name),
        )
        .toList();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/homemaker-listing', arguments: homemakers
        );
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          //color: Colors.deepPurple,
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
                  category.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
