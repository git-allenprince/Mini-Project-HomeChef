import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homechef_v3/screens/homemaker_listing/homemaker_listing_screen.dart';

class FoodSearchBox extends StatefulWidget {
  const FoodSearchBox({Key? key}) : super(key: key);

  @override
  _FoodSearchBoxState createState() => _FoodSearchBoxState();
}

class _FoodSearchBoxState extends State<FoodSearchBox> {
  TextEditingController _searchController = TextEditingController();
  late Stream<List<String>> _menuItemsStream;
  List<String> _menuItems = [];

  @override
  void initState() {
    super.initState();
    _menuItemsStream = _fetchMenuItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Stream<List<String>> _fetchMenuItems() {
    return FirebaseFirestore.instance
        .collection('menus')
        .snapshots()
        .map((snapshot) {
      List<String> items = [];
      for (var doc in snapshot.docs) {
        String itemName = doc['name'];
        items.add(itemName);
      }
      return items;
    });
  }

  Future<List<String>> _fetchHomemakersForItem(String itemName) async {
    List<String> homemakerIds = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('menus')
        .where('name', isEqualTo: itemName.toLowerCase())
        .get();

    for (var doc in querySnapshot.docs) {
      String homemakerId = doc['homemakerid'];
      homemakerIds.add(homemakerId);
    }

    return homemakerIds;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'What would you like to eat?',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () async {
                    String query = _searchController.text.trim();
                    if (query.isNotEmpty) {
                      List<String> homemakerIds =
                          await _fetchHomemakersForItem(query);
                      if (homemakerIds.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomemakerListingScreen(
                                homemakerIds: homemakerIds),
                          ),
                        );
                      } else {
                        // Handle when no homemakers are found for the searched item
                        print('No homemakers found for $query');
                      }
                    } else {
                      // Handle when no search query is entered
                      print('Please enter a search query.');
                    }
                  },
                ),
                contentPadding:
                    const EdgeInsets.only(left: 20, bottom: 5, top: 12.5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
