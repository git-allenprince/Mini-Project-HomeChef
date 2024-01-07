import 'package:equatable/equatable.dart';

import 'package:homechef_v3/models/delivery_time_model.dart';

import 'package:homechef_v3/models/menu_item_model.dart';
import 'package:homechef_v3/models/product_model.dart';

class Basket extends Equatable {
  final List<Product> products;
  final bool cutlery;

  final DeliveryTime? deliveryTime;

  Basket(
      {this.products = const <Product>[],
      this.cutlery = false,
      this.deliveryTime});

  Basket copyWith({
    List<Product>? products,
    bool? cutlery,
    DeliveryTime? deliveryTime,
  }) {
    return Basket(
        products: products ?? this.products,
        cutlery: cutlery ?? this.cutlery,
        deliveryTime: deliveryTime ?? this.deliveryTime);
  }

  @override
  List<Object?> get props => [products, cutlery, deliveryTime];

  Map itemQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double total(subtotal) {
    return subtotal + 50;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal).toStringAsFixed(2);
}
