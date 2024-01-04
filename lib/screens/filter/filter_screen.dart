import 'package:flutter/material.dart';
import 'package:homechef_v3/models/category_model.dart';
import 'package:homechef_v3/models/price_model.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => FilterScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                    // fontFamily:
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomPriceFilter(prices: Price.prices),
              SizedBox(
                height: 10,
              ),
              Text(
                'Category',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                    // fontFamily:
                    ),
              ),
              CustomCategoryFilter(
                categories: Category.categories,
              )
            ],
          ),
        ));
  }
}

class CustomPriceFilter extends StatelessWidget {
  final List<Price> prices;

  const CustomPriceFilter({
    Key? key,
    required this.prices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: prices
            .map((price) => InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    // margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      price.price,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ))
            .toList());
  }
}

class CustomCategoryFilter extends StatelessWidget {
  final List<Category> categories;

  const CustomCategoryFilter({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(50)),
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categories[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 25,
                  child: Checkbox(
                    activeColor: Colors.white,
                    value: false,
                    onChanged: (bool? newValue) {},
                  ),
                )
              ],
            ),
          );
        });
  }
}
