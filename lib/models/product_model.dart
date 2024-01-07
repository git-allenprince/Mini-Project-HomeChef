import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String? restaurantId;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final num price;

  //final int? index;

  const Product({
    this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    //this.index,
  });

  Product copyWith({
    String? id,
    String? restaurantId,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    //int? index,
  }) {
    return Product(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      //index: index ?? this.index,
    );
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'].toString(),
      restaurantId: snap['restaurantId'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      //index: snap['index'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
        imageUrl,
        // index,
      ];

  static List<Product> products = const [
    Product(
      id: '1',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'Appam',
      category: 'Breakfast',
      description: 'Soft, fluffy center, crisp',
      price: 55,
      imageUrl: 'assets/images/appam.jpg',
    ),
    Product(
      id: '2',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'Dosa',
      category: 'Breakfast',
      description:
          'South Indian, fermented crepe made from rice batter and black lentils',
      price: 75,
      imageUrl: 'assets/images/dosa.jpeg',
    ),
    Product(
      id: '3',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'Pothichoru',
      category: 'Lunch',
      description: 'Rice with curries in banana leaf',
      price: 125,
      imageUrl: 'assets/images/pothichorr.jpeg',
    ),
    Product(
      id: '4',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'GheeRice',
      category: 'Lunch',
      description: 'one pot rice dish made with ghee, rice',
      price: 95,
      imageUrl: 'assets/images/gheerice.jpeg',
    ),
    Product(
      id: '5',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'Biriyani',
      category: 'Dinner',
      description: 'a spiced mix of meat and rice,',
      price: 135,
      imageUrl: 'assets/images/biriyani.jpeg',
    ),
    Product(
      id: '6',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'Veg Club Sandwich',
      category: 'Sandwich',
      description:
          'Club sandwiches made vegetarian with lots of veggies, mayo & herbs',
      price: 100,
      imageUrl: 'assets/images/sandwich.png',
    ),
    Product(
      id: '7',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'WaterMelon Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 40,
      imageUrl: 'assets/images/watermelon.jpeg',
    ),
    Product(
      id: '8',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'Pineapple Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 35,
      imageUrl: 'assets/images/pineapple.jpeg',
    ),
    Product(
      id: '9',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'Pomegranate Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 45,
      imageUrl: 'assets/images/pomogranete.jpeg',
    ),
    Product(
      id: '10',
      restaurantId: 'TLiVCyp5J7dWTHR7bUi7',
      name: 'Chappathi',
      category: 'Dinner',
      description: 'Round flat unleavened bread',
      price: 55,
      imageUrl: 'assets/images/chappathi.jpeg',
    )
  ];
}
