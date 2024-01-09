import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homechef_v3/models/homemaker_model.dart';
import 'package:homechef_v3/screens/homemaker_details/homemaker_details_screen.dart';
import 'widgets.dart';

class HomemakerCard extends StatelessWidget {
  final DocumentSnapshot homemakerSnapshot;

  const HomemakerCard({
    Key? key,
    required this.homemakerSnapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homemakerData = homemakerSnapshot.data() as Map<String, dynamic>;
    final homemakerId = homemakerSnapshot.id;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                HomemakerDetailsScreen(homemakerId: homemakerId),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors
                        .grey, // Placeholder color while loading or if image is null
                  ),
                  child: homemakerData['image_url'] != null
                      ? Image.network(
                          homemakerData['image_url'],
                          fit: BoxFit.cover,
                        )
                      : Icon(Icons.image,
                          size: 50,
                          color: Colors.white), // Placeholder icon or widget
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homemakerData['store_name'] ??
                        '', // Display store_name; use empty string if null
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  // Add other widgets for additional data display
                  // For example:
                  // Text(
                  //   '${homemakerData['distance']}km - ₹${homemakerData['delivery_fee']} delivery fee',
                  //   style: Theme.of(context).textTheme.bodyText1,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
