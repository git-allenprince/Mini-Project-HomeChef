import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homechef_v3/models/menu_item_model.dart';
import 'package:homechef_v3/models/subscription_model.dart';

part 'subscription_event.dart';
part 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(SubscriptionLoading());

  Stream<SubscriptionState> mapEventToState(
    SubscriptionEvent event,
  ) async* {
    if (event is StartSubscription) {
      yield* _mapStartSubscriptionToState();
    }

    if (event is AddSubItem) {
      yield* _mapAddSubItemToState(event, state);
    }

    if (event is RemoveSubItem) {
      yield* _mapRemoveSubItemToState(event, state);
    }
  }

  Stream<SubscriptionState> _mapStartSubscriptionToState() async* {
    yield SubscriptionLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield SubscriptionLoaded(subscription: Subscription());
    } catch (_) {}
  }

  Stream<SubscriptionState> _mapAddSubItemToState(
      AddSubItem event, SubscriptionState state) async* {
    if (state is SubscriptionLoaded) {
      try {
        yield SubscriptionLoaded(
            subscription: state.subscription.copyWith(
                items: List.from(state.subscription.items)..add(event.item)));
      } catch (_) {}
    }
  }

  Stream<SubscriptionState> _mapRemoveSubItemToState(
      RemoveSubItem event, SubscriptionState state) async* {
    if (state is SubscriptionLoaded) {
      try {
        yield SubscriptionLoaded(
            subscription: state.subscription.copyWith(
                items: List.from(state.subscription.items)..add(event.item)));
      } catch (_) {}
    }
  }
}
