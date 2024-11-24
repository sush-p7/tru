part of 'user_auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;
  final String domain;
  final String company;

  LoginRequested({
    required this.username,
    required this.password,
    required this.domain,
    required this.company,
  });

  @override
  List<Object> get props => [username, password, domain, company];
}

class CheckAuthStatus extends AuthEvent {}

class LogoutRequested extends AuthEvent {}
