// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison

import 'dart:async';
import 'dart:developer' as developer;
import 'package:meta/meta.dart';
import '../../repository/auth/auth_repo.dart';
import 'auth_bloc.dart';
import 'auth_state.dart';

@immutable
abstract class AuthEvent {
  Stream<AuthState> applyAsync({AuthState currentState, AuthBloc bloc});
}

class UserLoginEvent extends AuthEvent {
  final AuthRepository authRepository;

  UserLoginEvent(this.authRepository, );
  @override
  Stream<AuthState> applyAsync(
      {AuthState? currentState, AuthBloc? bloc}) async* {
  try {
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield AuthErrorState(_.toString());
    }
  }
}

class UserRegEvent extends AuthEvent {
  final AuthRepository authRepository;
  UserRegEvent(this.authRepository, );
  @override
  Stream<AuthState> applyAsync(
      {AuthState? currentState, AuthBloc? bloc}) async* {
    try {
     
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadRegistrationEvent', error: _, stackTrace: stackTrace);
      yield AuthErrorState(_.toString());
    }
  }
}
