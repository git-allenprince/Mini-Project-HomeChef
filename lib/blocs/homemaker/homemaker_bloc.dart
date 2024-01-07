import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homechef_v3/models/models.dart';
import 'package:homechef_v3/repository/homemaker/homemaker_repository.dart';

part 'homemaker_event.dart';
part 'homemaker_state.dart';

class HomemakerBloc extends Bloc<HomemakerEvent, HomemakerState> {
  final HomemakerRepository _homemakerRepository;
  StreamSubscription? _homemakerSubscription;

  HomemakerBloc({
    required HomemakerRepository homemakerRepository,
  })  : _homemakerRepository = homemakerRepository,
        super(HomemakerLoading()) {
    on<LoadHomemakers>(_onLoadHomemakers);

    _homemakerSubscription = _homemakerRepository
        .getHomemaker()
        .listen((homemakers) => add(LoadHomemakers(homemakers: homemakers)));
  }

  void _onLoadHomemakers(
    LoadHomemakers event,
    Emitter<HomemakerState> emit,
  ) {
    emit(HomemakerLoaded(homemakers: event.homemakers));
  }

  @override
  Future<void> close() async {
    _homemakerSubscription?.cancel();
    super.close();
  }
}
