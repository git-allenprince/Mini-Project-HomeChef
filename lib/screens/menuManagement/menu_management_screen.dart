import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homechef_v3/screens/Login/loginpagecombined.dart';
import 'package:homechef_v3/screens/menuManagement/add_menu_item.dart';

class MenuManagementScreen extends StatefulWidget {
  final String homemakerId;

  const MenuManagementScreen({Key? key, required this.homemakerId})
      : super(key: key);

  @override
  _MenuManagementScreenState createState() => _MenuManagementScreenState();
}

class _MenuManagementScreenState extends State<MenuManagementScreen> {
  late Set<String> uniqueCategories;
  late Stream<QuerySnapshot> menuStream;

  @override
  void initState() {
    super.initState();
    uniqueCategories = Set<String>();
    menuStream = FirebaseFirestore.instance
        .collection('menus')
        .where('homemakerid', isEqualTo: widget.homemakerId)
        .orderBy('category')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Menu Management',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                    (route) => false,
              );
            },
            icon: Text(
              'Sign Out',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: menuStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No menu items found.'));
          }

          uniqueCategories = _extractUniqueCategories(snapshot.data!.docs);

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              QueryDocumentSnapshot doc = snapshot.data!.docs[index];
              String category = doc['category'].toString().toLowerCase();

              if (uniqueCategories.contains(category)) {
                uniqueCategories.remove(category);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        category.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    _buildListItem(doc),
                  ],
                );
              } else {
                return _buildListItem(doc);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMenuItemScreen(homemakerId: widget.homemakerId),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Set<String> _extractUniqueCategories(List<QueryDocumentSnapshot> docs) {
    Set<String> categories = Set<String>();
    for (QueryDocumentSnapshot doc in docs) {
      String category = doc['category'].toString().toLowerCase();
      categories.add(category);
    }
    return categories;
  }

  Widget _buildListItem(QueryDocumentSnapshot doc) {
    return ListTile(
      title: Text(
        doc['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(doc['description']),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          _deleteMenuItem(doc.id);
        },
      ),
    );
  }

  void _deleteMenuItem(String documentId) {
    FirebaseFirestore.instance
        .collection('menus')
        .doc(documentId)
        .delete()
        .then((value) {
      print('Menu item deleted successfully.');
    }).catchError((error) {
      print('Failed to delete menu item: $error');
    });
  }
}
