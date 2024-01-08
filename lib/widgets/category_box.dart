import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homechef_v3/models/item_menu_model.dart';
import '../screens/homemaker_listing/homemaker_listing_screen.dart';

class CategoryBox extends StatelessWidget {
  final ItemMenu category;

  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        try {
          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection('menus')
              .where('name', isEqualTo: category.name.toLowerCase()) // Convert to lowercase
              .get();

          List<String> homemakerIds = [];

          querySnapshot.docs.forEach((doc) {
            if (doc.exists) {
              Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

              if (data != null && data.containsKey('homemakerid')) {
                homemakerIds.add(data['homemakerid'] as String);
              }
            }
          });
          print('Homemaker IDs for ${category.name}: $homemakerIds');
          print('Query returned ${querySnapshot.size} documents for ${category.name}');
          if (homemakerIds.isNotEmpty) {
            print('Homemaker IDs for ${category.name}: $homemakerIds');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HomemakerListingScreen(
                  homemakerIds: homemakerIds,
                ),
              ),
            );
          } else {
            print('No homemaker IDs found for ${category.name}');
          }
        } catch (e) {
          print('Error fetching homemaker IDs: $e');
        }
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
                  image: DecorationImage(
                    image: AssetImage(category.imageUrl), // Use AssetImage for local assets
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  category.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
