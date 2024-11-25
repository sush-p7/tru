part of 'user_auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  final String? errorMessage;
  final String? token;
  final bool isLoading;

  const AuthState({
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.token,
    this.isLoading = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    String? token,
    bool? isLoading,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, token, isLoading];
}

enum AuthStatus { initial, authenticated, unauthenticated, error, checking }
