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
    final homemakerId =
        homemakerSnapshot.id; // Assuming the document ID is the homemakerId

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
                    image: DecorationImage(
                      image: NetworkImage(homemakerData['image_url']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homemakerData['store_name'],
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  // Text(
                  //   'Homemaker ID: $homemakerId', // Display homemakerId
                  //   style: TextStyle(
                  //     color: Colors.grey, // Customize color if needed
                  //   ),
                  // )
                  // SizedBox(height: 5),
                  // // Add other widgets for additional data display
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
