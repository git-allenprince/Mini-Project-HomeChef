import 'package:equatable/equatable.dart';
import 'package:homechef_v3/models/delivery_time_model.dart';
import 'package:homechef_v3/models/menu_item_model.dart';

class Basket extends Equatable {
  final List<MenuItem> items;
  final bool cutlery;
  final DeliveryTime? deliveryTime;

  Basket(
      {this.items = const <MenuItem>[],
      this.cutlery = false,
      this.deliveryTime});

  Basket copyWith({
    List<MenuItem>? items,
    bool? cutlery,
    DeliveryTime? deliveryTime,
  }) {
    return Basket(
        items: items ?? this.items,
        cutlery: cutlery ?? this.cutlery,
        deliveryTime: deliveryTime ?? this.deliveryTime);
  }

  @override
  List<Object?> get props => [items, cutlery, deliveryTime];

  Map itemQuantity(items) {
    var quantity = Map();

    items.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subtotal) {
    return subtotal + 50;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal).toStringAsFixed(2);
}
