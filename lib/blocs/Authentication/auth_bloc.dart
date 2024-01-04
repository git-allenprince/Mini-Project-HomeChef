// auth_bloc.dart

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:homechef_v3/blocs/Authentication/auth_event.dart';
import 'package:homechef_v3/blocs/Authentication/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginButtonPressed) {
      yield AuthLoading();

      // Simulate an authentication process (replace with actual authentication logic)
      await Future.delayed(Duration(seconds: 2));

      // Check credentials (replace with actual authentication logic)
      if (event.username == 'user' && event.password == 'password') {
        yield AuthSuccess(username: event.username);
      } else {
        yield AuthFailure(error: 'Invalid credentials');
      }
    }
  }
}
