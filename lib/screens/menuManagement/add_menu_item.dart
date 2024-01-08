import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMenuItemScreen extends StatefulWidget {
  final String homemakerId;

  const AddMenuItemScreen({Key? key, required this.homemakerId})
      : super(key: key);

  @override
  _AddMenuItemScreenState createState() => _AddMenuItemScreenState();
}

class _AddMenuItemScreenState extends State<AddMenuItemScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Menu Item'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: widget.homemakerId.isNotEmpty ? _addMenuItem : null,
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to add a new menu item
  void _addMenuItem() {
    FirebaseFirestore.instance.collection('menus').add({
      'homemakerid': widget.homemakerId, // Correct field name used here
      'name': _nameController.text.trim().toLowerCase(),
      'category': _categoryController.text.trim().toLowerCase(),
      'description': _descriptionController.text.trim(),
      'price': double.parse(_priceController.text.trim()),
      'imageUrl': _imageUrlController.text.trim(),
    }).then((value) {
      print('Menu item added successfully.');
      Navigator.pop(
          context); // Go back to the previous screen after adding the item
    }).catchError((error) {
      print('Failed to add menu item: $error');
    });
  }
}
