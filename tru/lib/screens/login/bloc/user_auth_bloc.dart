import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  UserAuthBloc() : super(UserAuthInitial()) {
    on<UserAuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AfterLoginButtonClick>(afterLoginButtonClick);
    on<IsLogin>(isLogin);
    on<LoginSuccess>(loginSuccess);
  }

  // FutureOr<void> afterLoginButtonClick(
  //     AfterLoginButtonClick event, Emitter<UserAuthState> emit) async {
  //   var client = http.Client();
  //   try {
  //     var response = await client.post(
  //         Uri.parse(
  //           'https://erp-application.jwllogic.com/e11Pilot2100/TokenResource.svc/',
  //         ),
  //         body: {'Password': event.password, 'Username': event.username});
  //     if (response.statusCode == 200) {
  //       try {
  //         // Parse JSON response
  //         final Map<String, dynamic> responseData = jsonDecode(response.body);

  //         // Extract AccessToken
  //         final String token = responseData['AccessToken'];

  //         print('AccessToken: $token');
  //         const storage = FlutterSecureStorage();
  //         await storage.write(key: 'AccessToken', value: token);
  //         emit(NavAuthScreenToPOApprovelState());
  //       } catch (e) {
  //         print('Error extracting token: $e');
  //       }
  //     } else {
  //       print('Error: ${response.statusCode} ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<void> afterLoginButtonClick(
      AfterLoginButtonClick event, Emitter<UserAuthState> emit) async {
    var client = http.Client();
    const storage = FlutterSecureStorage(); // Reuse single instance
    print(event.username + " " + event.password);
    try {
      final response = await client.post(
        Uri.parse(
            "https://erp-application.jwllogic.com/e11Pilot2100/TokenResource.svc/"),
        body: {
          'Password': event.password,
          'Username': event.username,
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;

        // Validate token
        if (!responseData.containsKey('AccessToken')) {
          throw Exception('AccessToken not found in the response');
        }

        final String token = responseData['AccessToken'];

        // Save token securely
        await storage.write(key: "AccessToken", value: token);

        emit(NavAuthScreenToPOApprovelState());
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error during login: $e');
    } finally {
      client.close(); // Ensure client is always closed
    }
  }

  FutureOr<void> isLogin(IsLogin event, Emitter<UserAuthState> emit) async {
    var client = http.Client();
    try {
      const storage = FlutterSecureStorage();

      String? storedKey = await storage.read(key: 'AccessToken');

      // Create headers
      final headers = {
        'Authorization':
            'Bearer $storedKey', // Send token in Authorization header
        'Content-Type': 'application/json', // Optional: Specify content type
      };

      // Send the request
      final response = await client.post(
        Uri.parse(
            'https://erp-application.jwllogic.com/e11Pilot2100/TokenResource.svc/'),
        headers: headers,
      );

      // Handle the response
      if (response.statusCode == 200) {
        print('Success: ${response.body}');
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String token = responseData['AccessToken'];

        print('AccessToken: $token');
        const storage = FlutterSecureStorage();
        await storage.write(key: 'AccessToken', value: token);
      } else {
        print('Error: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> loginSuccess(LoginSuccess event, Emitter<UserAuthState> emit) {
    emit(AuthSucessState());
  }
}