import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int index;

  const Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.index,
  });

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    int? index,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      index: index ?? this.index,
    );
  }

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
      id: snap['id'].toString(),
      name: snap['name'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      index: snap['index'],
    );
  }

  @override
  List<Object> get props => [id, name, description, imageUrl, index];

  static List<Category> categories = const [
    Category(
      id: '1',
      name: 'Breakfast',
      description:
          'Start your day with a delightful feast! Our breakfast options are a symphony of flavors delivered to your doorstep, ensuring a fresh and savory beginning to your morning.',
      imageUrl: 'images/breakfast.jpeg',
      index: 0,
    ),
    Category(
      id: '2',
      name: 'Lunch',
      description:
          'Indulge in a midday masterpiece with our lunchtime delights! Our curated menu brings you a symphony of savory flavors, prepared with passion and delivered straight to your door.',
      imageUrl: 'images/pothichorr.jpeg',
      index: 1,
    ),
    Category(
      id: '3',
      name: 'Dinner',
      description:
          'Transform your evenings with our gourmet dinner offerings! Elevate your dining experience with a delectable selection of dishes crafted to perfection.',
      imageUrl: 'images/gheerice.jpeg',
      index: 2,
    ),
  ];
}
