part of 'homemaker_bloc.dart';

sealed class HomemakerEvent extends Equatable {
  const HomemakerEvent();

  @override
  List<Object> get props => [];
}

class LoadHomemakers extends HomemakerEvent {
  final List<Homemaker> homemakers;

  LoadHomemakers({required this.homemakers});

  @override
  List<Object> get props => [homemakers];
}
