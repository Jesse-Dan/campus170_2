import 'package:equatable/equatable.dart';



abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginLoadedState extends AuthState {
  const LoginLoadedState();

  @override
  String toString() => 'UnLoginState';
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  const AuthInitialState();

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  const AuthErrorState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLoginState$errorMessage';

  @override
  List<Object> get props => [errorMessage];
}

class RegLoadedState extends AuthState {
  const RegLoadedState();

  @override
  String toString() => 'UnLoginState';
  @override
  List<Object> get props => [];
}
