import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FlutterSecureStorage storage;
  final http.Client httpClient;

  AuthBloc({
    required this.storage,
    required this.httpClient,
  }) : super(const AuthState()) {
    on<LoginRequested>(_handleLogin);
    on<CheckAuthStatus>(_handleCheckAuth);
    on<LogoutRequested>(_handleLogout);
  }

  Future<void> _handleLogin(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: AuthStatus.checking,
        isLoading: true,
      ));

      // emit(state.copyWith(isLoading: true));
      // https://erp-application.jwllogic.com/e11Pilot2100/TokenResource.svc/
      // erp-application.jwllogic.com
      // e11Pilot2100
      print("Conrol reached");
      final String ENV = event.ENV.trim();
      final String URL = event.URL.trim();
      final String UerID = event.username.trim();
      await storage.write(key: 'ENV', value: ENV);
      await storage.write(key: 'URL', value: URL);
      await storage.write(key: 'USER', value: UerID);

      final response = await httpClient.post(
        Uri.parse("https://$URL/$ENV/TokenResource.svc/"),
        body: {
          'Password': event.password,
          'Username': event.username,
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;

        if (!responseData.containsKey('AccessToken')) {
          throw Exception('AccessToken not found in response');
        }

        final token = responseData['AccessToken'];
        await storage.write(key: 'AccessToken', value: token);
        // log("New token" + token);

        emit(state.copyWith(
          status: AuthStatus.authenticated,
          token: token,
          isLoading: false,
          errorMessage: null,
        ));
      } else {
        throw Exception('Login failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _handleCheckAuth(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // print(object)
      emit(state.copyWith(
        status: AuthStatus.checking,
        isLoading: true,
      ));

      //emit(state.copyWith(isLoading: true));

      final storedToken = await storage.read(key: 'AccessToken');
      final ENV = await storage.read(key: 'ENV');
      final URL = await storage.read(key: 'URL');

      if (storedToken == null) {
        emit(state.copyWith(
          status: AuthStatus.unauthenticated,
          isLoading: false,
        ));
        return;
      }

      final response = await httpClient.post(
        Uri.parse('https://$URL/$ENV/TokenResource.svc/'),
        headers: {
          'Authorization': 'Bearer $storedToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final newToken = responseData['AccessToken'];

        await storage.write(key: 'AccessToken', value: newToken);

        // print("storedToken :-   " + storedToken);
        // print("New replace toekn token  :-  " + newToken);
        emit(state.copyWith(
          status: AuthStatus.authenticated,
          token: newToken,
          isLoading: false,
        ));
      } else {
        throw Exception('Token validation failed');
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _handleLogout(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await storage.delete(key: 'AccessToken');
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
      token: null,
      errorMessage: null,
    ));
  }
}
