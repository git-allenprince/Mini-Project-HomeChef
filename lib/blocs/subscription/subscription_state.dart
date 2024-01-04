part of 'subscription_bloc.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object> get props => [];
}

class SubscriptionLoading extends SubscriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionLoaded extends SubscriptionState {
  final Subscription subscription;

  SubscriptionLoaded({required this.subscription});

  @override
  List<Object> get props => [];
}

// class SubscriptionSaved extends SubscriptionState {
//   @override
//   List<Object> get props => [];
// }
