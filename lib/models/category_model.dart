import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final Image image;

  Category({required this.id, required this.name, required this.image});

  @override
  List<Object?> get props => [id, name, image];
  static List<Category> categories = [
    Category(id: 1, name: 'Dosa', image: Image.asset('assets/dosa.png')),
    Category(id: 2, name: 'Appam', image: Image.asset('assets/appam.png')),
    Category(id: 3, name: 'Puttu', image: Image.asset('assets/puttu.png')),
    Category(id: 4, name: 'Parotta', image: Image.asset('assets/parotta.png')),
    Category(id: 5, name: 'Poori', image: Image.asset('assets/poori.png')),
    Category(
        id: 6, name: 'Pothichoru', image: Image.asset('assets/pothichoru.png')),
    Category(
        id: 7, name: 'Sandwich', image: Image.asset('assets/sandwich.png')),
  ];
}
