import 'package:equatable/equatable.dart';

import 'models.dart';

class Homemaker extends Equatable {
  final int id;
  final String imageUrl;
  final String name;

  final List<String> tags;

  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  Homemaker(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.tags,
      required this.menuItems,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.distance});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, imageUrl, name, tags, deliveryFee, deliveryTime, distance];

  static List<Homemaker> homemakers = [
    Homemaker(
        id: 1,
        imageUrl: 'https://source.unsplash.com/5oF7d_hPJG4',
        name: 'Homemaker A',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.homemakerId == 1)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.homemakerId == 1)
            .toList(),
        deliveryTime: 30,
        deliveryFee: 20,
        distance: 5),
    Homemaker(
        id: 2,
        imageUrl: 'https://source.unsplash.com/gFB1IPmH6RE',
        name: 'Homemaker B',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.homemakerId == 2)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.homemakerId == 2)
            .toList(),
        deliveryTime: 15,
        deliveryFee: 10,
        distance: 2.5),
    Homemaker(
        id: 3,
        imageUrl: 'https://source.unsplash.com/MQUqbmszGGM',
        name: 'Homemaker C',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.homemakerId == 3)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.homemakerId == 3)
            .toList(),
        deliveryTime: 40,
        deliveryFee: 30,
        distance: 7.5),
  ];
}
