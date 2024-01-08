import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homechef_v3/widgets/homemaker_card.dart';

class HomemakerListingScreen extends StatelessWidget {
  final List<String> homemakerIds;

  const HomemakerListingScreen({
    Key? key,
    required this.homemakerIds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homemaker Listing')),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: _fetchHomemakers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No homemaker available for this item.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return HomemakerCard(
                  homemakerSnapshot: snapshot.data![index],
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<DocumentSnapshot>> _fetchHomemakers() async {
    print('Homemaker IDs retrieved: $homemakerIds');
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('homemakerDetails')
        .where('homemakerId', whereIn: homemakerIds)
        .get();

    print('Query result for homemakerIds: ${querySnapshot.docs.length} documents found');

    return querySnapshot.docs;
  }
}
