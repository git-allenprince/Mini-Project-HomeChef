import 'package:equatable/equatable.dart';
import 'package:homechef_v3/models/category_model.dart';

class CategoryFilter extends Equatable {
  final int id;
  final Category category;
  final bool value;

  CategoryFilter({
    required this.id,
    required this.category,
    required this.value,
  });

  CategoryFilter copyWith({
    int? id,
    Category? category,
    bool? value,
  }) {
    return CategoryFilter(
        id: this.id,
        category: category ?? this.category,
        value: value ?? this.value);
  }

  List<Object?> get props => [
        id,
        category,
        value,
      ];

  static List<CategoryFilter> filters = Category.categories
      .map((category) =>
          CategoryFilter(id: category.id, category: category, value: false))
      .toList();
}
