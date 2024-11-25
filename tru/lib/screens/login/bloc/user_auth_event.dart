part of 'user_auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;
  final String URL;
  final String ENV;

  LoginRequested({
    required this.username,
    required this.password,
    required this.URL,
    required this.ENV,
  });

  @override
  List<Object> get props => [username, password, URL, ENV];
}

class CheckAuthStatus extends AuthEvent {}

class LogoutRequested extends AuthEvent {}
