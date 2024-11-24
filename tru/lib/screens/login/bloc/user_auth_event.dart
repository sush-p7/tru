part of 'user_auth_bloc.dart';

@immutable
sealed class UserAuthEvent {}

// Triggered when the user clicks the login button
class AfterLoginButtonClick extends UserAuthEvent {
  final String domainURL;
  final String compnay;
  final String username;
  final String password;

  AfterLoginButtonClick(
      {required this.domainURL,
      required this.compnay,
      required this.username,
      required this.password});
}

// Triggered when the user updates the username field
class UsernameChanged extends UserAuthEvent {
  final String username;
  UsernameChanged(this.username);
}

// Triggered when the user updates the password field
class PasswordChanged extends UserAuthEvent {
  final String password;
  PasswordChanged(this.password);
}

// Triggered to start the actual login process
class LoginStarted extends UserAuthEvent {}

// Triggered when a login attempt fails
class LoginFailed extends UserAuthEvent {
  final String errorMessage;
  LoginFailed(this.errorMessage);
}

// Triggered when the login process succeeds
class LoginSuccess extends UserAuthEvent {
  final String userToken;
  LoginSuccess(this.userToken);
}

class NaviagateToPoApprovel extends UserAuthEvent {}

// Triggered to reset the login state
class ResetLoginState extends UserAuthEvent {}

// Triggered when biometric authentication is requested
class BiometricAuthRequested extends UserAuthEvent {}

// initial log in
class IsLogin extends UserAuthEvent {}

// new code

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
