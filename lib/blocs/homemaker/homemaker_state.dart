part of 'homemaker_bloc.dart';

abstract class HomemakerState extends Equatable {
  const HomemakerState();

  @override
  List<Object> get props => [];
}

class HomemakerLoading extends HomemakerState {}

class HomemakerLoaded extends HomemakerState {
  final List<Homemaker> homemakers;

  HomemakerLoaded({required this.homemakers});

  @override
  List<Object> get props => [homemakers];
}
