import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final http.Client httpClient;

  HomeBloc({http.Client? client})
      : httpClient = client ?? http.Client(),
        super(const HomeInitial()) {
    on<DropdownChangedEvent>(_onDropdownChanged);
    on<FetchPORequestsEvent>(_onFetchPORequests);
  }

  // HomeBloc() : super(HomeInitial()) {
  //   on<DropdownChangedEvent>(_onDropdownChanged);
  //   // on<HomeEvent>((event, emit) {
  //   //   // TODO: implement event handler
  //   // });
  // }
  void _onDropdownChanged(DropdownChangedEvent event, Emitter<HomeState> emit) {
    final state = DropdownChangedState(selectedValue: event.selectedValue);

    // If Requests is selected, trigger API fetch
    if (event.selectedValue == 'Requests') {
      add(const FetchPORequestsEvent());
    }

    emit(state);
  }

  Future<void> _onFetchPORequests(
      FetchPORequestsEvent event, Emitter<HomeState> emit) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();

    try {
      // Emit loading state
      final storedToken = await storage.read(key: 'AccessToken');
      final ENV = await storage.read(key: 'ENV');
      final URL = await storage.read(key: 'URL');
      final USER = await storage.read(key: 'USER');
      emit(PORequestsLoadingState(selectedValue: state.selectedValue));

      // Prepare the API URL
      final uri = Uri.parse(
        'https://erp-application.jwllogic.com/e11dev2100/api/v1/Erp.BO.POSvc/POes?\$filter=BuyerID eq \'tru1\' and VS_TypeOfPO_c ne \'IBD\'',
      );

      // Make the API call
      final response = await httpClient.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $storedToken',
          // Add any necessary authentication headers
          // 'Authorization': 'Bearer YOUR_TOKEN',
        },
      );

      // Check response status
      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> poRequests =
            json.decode(response.body)['value'] ?? [];

        // Emit loaded state
        emit(PORequestsLoadedState(
            selectedValue: state.selectedValue, poRequests: poRequests));
      } else {
        // Emit error state
        emit(PORequestsErrorState(
            selectedValue: state.selectedValue,
            errorMessage:
                'Failed to load PO Requests: ${response.statusCode}'));
      }
    } catch (e) {
      // Emit error state for any exceptions
      emit(PORequestsErrorState(
          selectedValue: state.selectedValue,
          errorMessage: 'An error occurred: ${e.toString()}'));
    }
  }
}
