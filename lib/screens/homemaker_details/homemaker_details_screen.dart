import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homechef_v3/blocs/basket/basket_bloc.dart';

class HomemakerDetailsScreen extends StatelessWidget {
  final String homemakerId;

  const HomemakerDetailsScreen({Key? key, required this.homemakerId})
      : super(key: key);

  Future<String> homemakerImage() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('homemakerDetails')
        .doc(homemakerId)
        .get();

    if (snapshot.exists) {
      return snapshot['image_url'];
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<String>(
              future: homemakerImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                String imageUrl = snapshot.data ?? '';

                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                );
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('menus')
                  .where('homemakerid', isEqualTo: homemakerId)
                  .orderBy('category', descending: false)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error occurred while loading data.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No data available for homemaker ID: $homemakerId',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return _buildMenuItemsList(snapshot.data!.docs, context);
              },
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/basket');
                },
                child: Text(
                  'Basket',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItemsList(List<QueryDocumentSnapshot> docs, BuildContext context) {
    Set<String> uniqueCategories = Set<String>.from(
      docs.map((doc) => doc['category'].toString().toLowerCase()),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (String category in uniqueCategories)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  category.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              for (QueryDocumentSnapshot doc in docs)
                if (doc['category'].toString().toLowerCase() == category)
                  _buildMenuItem(doc, context),
            ],
          ),
      ],
    );
  }

  Widget _buildMenuItem(QueryDocumentSnapshot menuItems, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(
              menuItems['name'],
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              menuItems['description'],
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\₹${menuItems['price']}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                IconButton(
                  onPressed: () {
                    MenuItem menuItem = MenuItem(
                      name: menuItems['name'],
                      description: menuItems['description'],
                      price: menuItems['price'],
                    );

                    context.read<BasketBloc>().add(AddItem(menuItem));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${menuItems['name']} added to basket'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(height: 2),
      ],
    );
  }
}

class MenuItem {
  final String name;
  final String description;
  final double price;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
  });

  dynamic operator [](String key) {
    switch (key) {
      case 'name':
        return name;
      case 'description':
        return description;
      case 'price':
        return price;
      default:
        return null;
    }
  }
}
