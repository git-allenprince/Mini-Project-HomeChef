import 'package:flutter/material.dart';
import 'package:homechef_v3/models/models.dart';

class FoodSearchBox extends StatefulWidget {
  const FoodSearchBox({Key? key}) : super(key: key);

  @override
  _FoodSearchBoxState createState() => _FoodSearchBoxState();
}

class _FoodSearchBoxState extends State<FoodSearchBox> {
  List<MenuItem> menuItems = MenuItem.menuItems; // Accessing the list from MenuItem model

  List<MenuItem> filteredItems = [];

  void filterItems(String query) {
    setState(() {
      filteredItems = menuItems
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: filterItems,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'What would you like to eat?',
                suffixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                contentPadding: const EdgeInsets.only(left: 20, bottom: 5, top: 12.5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              icon: Icon(Icons.menu, color: Theme.of(context).primaryColor),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
