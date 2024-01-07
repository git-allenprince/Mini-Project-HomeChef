part of 'subscription_bloc.dart';

abstract class SubscriptionEvent extends Equatable {
  const SubscriptionEvent();
}

class StartSubscription extends SubscriptionEvent {
  @override
  List<Object> get props => [];
}

class AddSubItem extends SubscriptionEvent {
  final MenuItem item;

  const AddSubItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveSubItem extends SubscriptionEvent {
  final MenuItem item;

  const RemoveSubItem(this.item);

  @override
  List<Object> get props => [item];
}

// class SaveSubscriptionPlanEvent extends SubscriptionEvent {
//   final List<String> selectedFoods;

//   SaveSubscriptionPlanEvent(this.selectedFoods);

//   @override
//   List<Object> get props => [selectedFoods];
// }
