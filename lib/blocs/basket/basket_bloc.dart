import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homechef_v3/models/basket_model.dart';
import 'package:homechef_v3/models/delivery_time_model.dart';
import 'package:homechef_v3/screens/homemaker_details/homemaker_details_screen.dart';
part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading());

  Stream<BasketState> mapEventToState(
    BasketEvent event,
  ) async* {
    if (event is StartBasket) {
      yield* _mapStartBasketToState();
    }
    if (event is AddItem) {
      yield* _mapAddItemToState(event, state);
    }
    if (event is RemoveItem) {
      yield* _mapRemoveItemToState(event, state);
    }
    if (event is RemoveAllItem) {
      yield* _mapRemoveAllItemToState(event, state);
    }
    if (event is ToggleSwitch) {
      yield* _mapToggleSwitchToState(event, state);
    }
    if (event is SelectDeliveryTime) {
      yield* _mapSelectDeliveryTimeToState(event, state);
    }
  }

  Stream<BasketState> _mapStartBasketToState() async* {
    yield BasketLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield BasketLoaded(basket: Basket());
    } catch (_) {}
  }

  Stream<BasketState> _mapAddItemToState(
      AddItem event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..add(event.item)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveItemToState(
      RemoveItem event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..remove(event.item)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveAllItemToState(
      RemoveAllItem event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)
                  ..removeWhere((item) => item == event.item)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapToggleSwitchToState(
      ToggleSwitch event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(cutlery: !state.basket.cutlery));
      } catch (_) {}
    }
  }
}

Stream<BasketState> _mapSelectDeliveryTimeToState(
    SelectDeliveryTime event, BasketState state) async* {
  if (state is BasketLoaded) {
    try {
      yield BasketLoaded(
          basket: state.basket.copyWith(deliveryTime: event.deliveryTime));
    } catch (_) {}
  }
}
