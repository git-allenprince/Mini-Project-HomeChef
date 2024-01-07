import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homechef_v3/models/basket_model.dart';
import 'package:homechef_v3/models/delivery_time_model.dart';
import '../../models/models.dart';
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
    if (event is AddProduct) {
      yield* _mapAddProductToState(event, state);
    }
    if (event is RemoveProduct) {
      yield* _mapRemoveProductToState(event, state);
    }
    if (event is RemoveAllProduct) {
      yield* _mapRemoveAllProductToState(event, state);
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

  Stream<BasketState> _mapAddProductToState(
      AddProduct event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                products: List.from(state.basket.products)
                  ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveProductToState(
      RemoveProduct event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                products: List.from(state.basket.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveAllProductToState(
      RemoveAllProduct event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                products: List.from(state.basket.products)
                  ..removeWhere((product) => product == event.product)));
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
