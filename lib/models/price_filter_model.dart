import 'package:equatable/equatable.dart';
import 'package:homechef_v3/models/Price_model.dart';

class PriceFilter extends Equatable {
  final int id;
  final Price price;
  final bool value;

  PriceFilter({
    required this.id,
    required this.price,
    required this.value,
  });

  PriceFilter copyWith({
    int? id,
    Price? Price,
    bool? value,
  }) {
    return PriceFilter(
        id: this.id, price: Price ?? this.price, value: value ?? this.value);
  }

  List<Object?> get props => [
        id,
        Price,
        value,
      ];

  static List<PriceFilter> filters = Price.prices
      .map((Price) => PriceFilter(id: Price.id, price: Price, value: false))
      .toList();
}
