part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class SignUpSuccefully extends AppState {}

class SignUpError extends AppState {
  final String error;
  SignUpError(this.error);
}

class LoginSuccefully extends AppState {}

class LoginError extends AppState {
  final String error;
  LoginError(this.error);
}

class ShowOrHidePassword extends AppState {}
