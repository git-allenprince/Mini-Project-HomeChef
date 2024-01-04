import 'package:equatable/equatable.dart';

class MenuItem extends Equatable{
  final int id;
  final int homemakerId;
  final String name;
  final String category;
  final String description;
  final double price;
// final String imageUrl;''
  MenuItem({required this.id, required this.homemakerId, required this.name, required this.category,required this.description, required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [id,homemakerId,name,category,description,price];

  static List<MenuItem> menuItems=[
    MenuItem(id: 1, homemakerId: 1, name: 'Dosa',category: 'Breakfast', description: 'With curry,Serves 1 ', price: 75),
    MenuItem(id: 2, homemakerId: 2, name: 'Dosa',category: 'Breakfast' , description: 'With curry,Serves 1 ', price: 75),
    MenuItem(id: 3, homemakerId: 3, name: 'Puttu', category: 'Breakfast',description: 'With curry,Serves 1', price: 75),
    MenuItem(id: 4, homemakerId: 1, name: 'Idli', category: 'Breakfast',description: 'With curry,Serves 1', price: 65),
    MenuItem(id: 5, homemakerId: 2, name: 'Poori', category: 'Breakfast',description: 'With curry,Serves 1', price: 65),
    MenuItem(id: 6, homemakerId: 3, name: 'Idli', category: 'Breakfast',description: 'With curry,Serves 1', price: 65),
    MenuItem(id: 7, homemakerId: 1, name: 'Appam', category: 'Breakfast',description: 'With curry,Serves 1', price: 55),
    MenuItem(id: 8, homemakerId: 2, name: 'Parotta', category: 'Breakfast',description: 'With curry,Serves 1', price: 55),
    MenuItem(id: 9, homemakerId: 3, name: 'Appam', category: 'Breakfast',description: 'With curry,Serves 1', price: 55),
    MenuItem(id: 10, homemakerId: 1, name: 'Pothichor', category: 'Lunch',description: 'Serves 1', price: 125),
    MenuItem(id: 11, homemakerId: 2, name: 'Pothichor', category: 'Lunch',description: 'Serves 1', price: 125),
    MenuItem(id: 12, homemakerId: 3, name: 'Pothichor', category: 'Lunch',description: 'Serves 1', price: 125),
    MenuItem(id: 13, homemakerId: 1, name: 'Ghee Rice', category: 'Lunch',description: 'With curry,Serves 1', price: 95),
    MenuItem(id: 14, homemakerId: 2, name: 'Ghee Rice', category: 'Lunch',description: 'With curry,Serves 1', price: 95),
    MenuItem(id: 15, homemakerId: 3, name: 'Ghee Rice', category: 'Lunch',description: 'With curry,Serves 1', price: 95),
    MenuItem(id: 16, homemakerId: 1, name: 'Biriyani', category: 'Dinner',description: 'Serves 1', price: 135),
    MenuItem(id: 17, homemakerId: 2, name: 'Biriyani', category: 'Dinner',description: 'Serves 1', price: 135),
    MenuItem(id: 18, homemakerId: 3, name: 'Biriyani',category: 'Dinner', description: 'Serves 1 ', price: 135),
    MenuItem(id: 19, homemakerId: 1, name: 'Chapathi',category: 'Dinner', description: 'With curry,Serves 1 ', price: 55),
    MenuItem(id: 20, homemakerId: 2, name: 'Chapathi',category: 'Dinner', description: 'With curry,Serves 1 ', price: 55),
    MenuItem(id: 21, homemakerId: 3, name: 'Chapathi',category: 'Dinner', description: 'With curry,Serves 1 ', price: 55),
    MenuItem(id: 22, homemakerId: 1, name: 'Roti',category: 'Dinner', description: 'With curry,Serves 1 ', price: 45),
    MenuItem(id: 23, homemakerId: 2, name: 'Roti',category: 'Dinner', description: 'With curry,Serves 1 ', price: 45),
    MenuItem(id: 24, homemakerId: 3, name: 'Roti',category: 'Dinner', description: 'With curry,Serves 1 ', price: 45),
  ];


}