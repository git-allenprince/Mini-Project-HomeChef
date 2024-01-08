import 'package:equatable/equatable.dart';

class ItemMenu extends Equatable {
  final String name;
  final String imageUrl;

  ItemMenu({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<ItemMenu> itemMenus = [
    ItemMenu(
      name: "Dosa",
      imageUrl: 'assets/dosa.png',
    ),
    ItemMenu(
      name: "Puttu",
      imageUrl: 'assets/puttu.png',
    ),
    ItemMenu(
      name: "Sandwich",
      imageUrl: 'assets/sandwich.png',
    ),
    ItemMenu(
      name: "Poori",
      imageUrl: 'assets/poori.png',
    ),
    ItemMenu(
      name: "Porotta",
      imageUrl: 'assets/parotta.png',
    ),
    ItemMenu(
      name: "Pothichoru",
      imageUrl: 'assets/pothichoru.png',
    ),
    // Add other items similarly...
  ];
}
