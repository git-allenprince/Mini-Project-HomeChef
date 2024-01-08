import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddHomemakerScreen extends StatelessWidget {
  static const String routeName = '/add_homemaker';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  // Add controllers for other fields as needed

  void _addHomemakerToFirestore(BuildContext context) async {
    // Get values from text controllers
    String name = nameController.text.trim();
    String category = categoryController.text.trim();
    // Get other values similarly

    // Upload data to Firestore
    try {
      await FirebaseFirestore.instance.collection('homemakers').add({
        'name': name,
        'category': category,
        // Add other fields here
      });
      // Show success message or navigate back
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Homemaker added successfully')),
      );
    } catch (e) {
      // Handle errors
      print('Error adding homemaker: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add homemaker')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Homemaker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            // Add other input fields for homemaker details

            ElevatedButton(
              onPressed: () {
                _addHomemakerToFirestore(context);
              },
              child: Text('Add Homemaker'),
            ),
          ],
        ),
      ),
    );
  }
}
