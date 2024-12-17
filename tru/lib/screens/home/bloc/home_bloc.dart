import 'dart:convert';
// import 'package:logger/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tru/screens/home/ui/po_approval.dart';
import 'package:tru/screens/po_detals/ui/po_details.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final http.Client httpClient;

  HomeBloc({http.Client? client})
      : httpClient = client ?? http.Client(),
        super(const HomeInitial()) {
    on<DropdownChangedEvent>(_onDropdownChanged);
    on<FetchPORequestsEvent>(_onFetchPORequests);
    on<FetchPOApprovelsEvent>(_onFetchPOApprovels);
    on<LoadPORequestsEvent>(_onLoadPORequests);
    on<NavigateToPODetailsEvent>(_onNavigateToPODetails);
    add(const DropdownChangedEvent('Approvels'));
    add(const FetchPOApprovelsEvent());
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
    if (event.selectedValue == 'Approvels') {
      add(const FetchPOApprovelsEvent());
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

  Future<void> _onFetchPOApprovels(
      FetchPOApprovelsEvent event, Emitter<HomeState> emit) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    try {
      emit(POApprovelsLoadingState(selectedValue: state.selectedValue));

      // Emit loading state
      final storedToken = await storage.read(key: 'AccessToken');
      final ENV = await storage.read(key: 'ENV');
      final URL = await storage.read(key: 'URL');
      final USER = await storage.read(key: 'USER');

      // Prepare the API URL
      final uri = Uri.parse(
        'https://erp-application.jwllogic.com/e11dev2100/api/v1/Erp.BO.POApvMsgSvc/List',
      );

      // Make the API call
      final approvalsResponse = await httpClient.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $storedToken',
          // Add any necessary authentication headers
          // 'Authorization': 'Bearer YOUR_TOKEN',
        },
      );

      if (approvalsResponse.statusCode != 200) {
        throw Exception(
            'Failed to load PO Approvals: ${approvalsResponse.statusCode}');
      }

      // Parse the PO numbers from the approvals
      final List<dynamic> poApprovals =
          json.decode(approvalsResponse.body)['value'] ?? [];

      // Extract unique PO numbers
      final List<int> poNumbers = poApprovals
          .map<int>((approval) => approval['PONum'] as int)
          .toSet()
          .toList();

      // Fetch details for each PO number
      final List<dynamic> poDetails = await _fetchPODetails(poNumbers);

      // Combine approvals with their corresponding PO details
      final List<dynamic> combinedPOData = poApprovals.map((approval) {
        // Find the matching PO detail
        final poDetail = poDetails.firstWhere(
          (detail) => detail['PONum'] == approval['PONum'],
          orElse: () => null,
        );

        return {
          ...approval,
          'PODetails': poDetail ?? {},
        };
      }).toList();

      //print(combinedPOData);
      emit(POApprovelsLoadedState(
          selectedValue: state.selectedValue, poApprovels: combinedPOData));

      // emit(POApprovelsLoadedState(
      //     selectedValue: state.selectedValue, poApprovels: []));
      // emit(POApprovelsErrorState(
      //     selectedValue: state.selectedValue,
      //     errorMessage: 'Failed to load PO Requests: '));
    } catch (e) {
      emit(POApprovelsErrorState(
          selectedValue: state.selectedValue,
          errorMessage: 'An error occurred: ${e.toString()}'));
    }
  }

  void _onLoadPORequests(
      LoadPORequestsEvent event, Emitter<HomeState> emit) async {
    // Your existing PO requests loading logic
    //emit(PORequestsLoadingState());
    try {
      // Fetch PO requests
      //final poRequests = await fetchPORequests();
      // emit(PORequestsLoadedState(poRequests: poRequests));
      add(NavigateToPODetailsEvent(event.poId));
    } catch (e) {
      //emit(PORequestsErrorState(errorMessage: e.toString()));
    }
  }

  void _onNavigateToPODetails(
      NavigateToPODetailsEvent event, Emitter<HomeState> emit) {
    // Emit a state that indicates navigation to PO Details
    emit(NavigateToPODetailsState(poId: event.poId));
  }

  Future<List<dynamic>> _fetchPODetails(List<int> poNumbers) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final storedToken = await storage.read(key: 'AccessToken');
    final ENV = await storage.read(key: 'ENV');
    final URL = await storage.read(key: 'URL');

    // Use Future.wait to fetch details for multiple PO numbers concurrently
    final detailsFutures = poNumbers.map((poNum) async {
      final detailsUri = Uri.parse(
        'https://$URL/$ENV/api/v1/Erp.BO.POSvc/POes(JWL,$poNum)',
      );

      try {
        final response = await httpClient.get(
          detailsUri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $storedToken',
          },
        );

        if (response.statusCode == 200) {
          return json.decode(response.body);
        } else {
          // Log the error, but continue with other requests
          print(
              'Failed to fetch details for PO $poNum: ${response.statusCode}');
          return null;
        }
      } catch (e) {
        print('Error fetching PO $poNum details: $e');
        return null;
      }
    });

    // Wait for all requests and filter out null responses
    final details = await Future.wait(detailsFutures);
    //print(details);
    return details.where((detail) => detail != null).toList();
  }
}
