import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'models.dart';

class Homemaker extends Equatable {
  final String id;
  final String imageUrl;
  final String name;
  final String description;
  final List<String> tags;
  final List<Category> categories;
  final List<Product> products;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  Homemaker(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.tags,
      required this.categories,
      required this.products,
      this.deliveryTime = 10,
      this.deliveryFee = 10,
      this.distance = 15});

  factory Homemaker.fromSnapshot(DocumentSnapshot snap) {
    return Homemaker(
      id: snap.id,
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      description: snap['description'],
      tags: (snap['tags'] as List).map(
        (tag) {
          return tag as String;
        },
      ).toList(),
      categories: (snap['categories'] as List).map(
        (category) {
          return Category.fromSnapshot(category);
        },
      ).toList(),
      products: (snap['products'] as List).map(
        (product) {
          return Product.fromSnapshot(product);
        },
      ).toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        tags,
        products,
        deliveryFee,
        deliveryTime,
        distance
      ];

  static List<Homemaker> homemakers = [];
}
