import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Promo(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  List<Object?> get props => [id, title, description, imageUrl];

  static List<Promo> promos = [
    Promo(
        id: 1,
        title: 'FREE Delivery on Your First 3 Orders.',
        description:
            'Place an order of \₹200 or more and the delivery fee is on us!',
        imageUrl: 'https://source.unsplash.com/rD3YrnhTmf0'),
    Promo(
        id: 2,
        title: '20% off on Selected Items',
        description: 'Get a discount on more than 200+ items!',
        imageUrl: 'https://source.unsplash.com/-YHSwy6uqvk')
  ];
}
