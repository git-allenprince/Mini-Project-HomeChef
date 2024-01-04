import 'package:equatable/equatable.dart';
import 'package:homechef_v3/models/menu_item_model.dart';

class Subscription extends Equatable {
  final List<MenuItem> items;

  Subscription({this.items = const <MenuItem>[]});

  Subscription copyWith({
    List<MenuItem>? items,
  }) {
    return Subscription(items: items ?? this.items);
  }

  @override
  List<Object?> get props => [items];

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
}
