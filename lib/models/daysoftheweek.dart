import 'package:equatable/equatable.dart';

class Day extends Equatable {
  final id;
  final String day;

  Day({required this.id, required this.day});

  @override
  List<Object?> get props => [id, day];

  static List<Day> days = [
    Day(id: 1, day: 'Sunday'),
    Day(id: 2, day: 'Monday'),
    Day(id: 3, day: 'Tuesday'),
    Day(id: 4, day: 'Wednesday'),
    Day(id: 5, day: 'Thursday'),
    Day(id: 6, day: 'Friday'),
    Day(id: 7, day: 'Saturday'),
  ];
}
