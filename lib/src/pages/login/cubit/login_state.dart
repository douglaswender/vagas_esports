part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess<T> extends LoginState {
  final T data;

  LoginSuccess(this.data);
}
