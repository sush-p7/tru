part of 'user_auth_bloc.dart';

@immutable
sealed class UserAuthState {}

abstract class UserAuthActionState extends UserAuthState {}

final class UserAuthInitial extends UserAuthState {}

class LoadingState extends UserAuthState {}

class AuthSucessState extends UserAuthState {}

class AuthFailedState extends UserAuthState {}

class NavAuthScreenToPOApprovelState extends UserAuthActionState {}
