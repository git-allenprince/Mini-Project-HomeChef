import 'package:equatable/equatable.dart';

class MenuItem extends Equatable{
  final int id;
  final int homemakerId;
  final String name;
  final String description;
  final double price;
// final String imageUrl;''
  MenuItem({required this.id, required this.homemakerId, required this.name, required this.description, required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [id,homemakerId,name,description,price];

  static List<MenuItem> menuItems=[
    MenuItem(id: 1, homemakerId: 1, name: 'Dosa', description: 'Adipoli Dosa', price: 75),
    MenuItem(id: 2, homemakerId: 2, name: 'Idli', description: 'Adipoli Appam', price: 55),
    MenuItem(id: 3, homemakerId: 3, name: 'Dosa', description: 'Adipoli Puttu', price: 65),
  ];


}