import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tru/widgets/po_list.dart';
part 'po_detail_event.dart';
part 'po_detail_state.dart';

// class PoDetailBloc extends Bloc<PoDetailEvent, PoDetailState> {
//   PoDetailBloc() : super(PoDetailInitial()) {
//     on<PoDetailEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class PODetailsBloc extends Bloc<PODetailsEvent, PODetailsState> {
  PODetailsBloc() : super(PODetailsInitial()) {
    on<FetchPODetails>(_onFetchPODetails);
  }

  Future<void> _onFetchPODetails(
    FetchPODetails event,
    Emitter<PODetailsState> emit,
  ) async {
    emit(PODetailsLoading());
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final storedToken = await storage.read(key: 'AccessToken');
    final ENV = await storage.read(key: 'ENV');

    try {
      final url = Uri.parse(
          'https://erp-application.jwllogic.com/e11dev2100/api/v1/BaqSvc/VSPOApp_PODetails(JWL)/?VSComp=${event.company}&VSPONum=${event.poNumber}');

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $storedToken',
        // Add any necessary authentication headers
        // 'Authorization': 'Bearer YOUR_TOKEN',
      });

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        //print(decodedData);
        //print("Code erun");

        emit(PODetailsLoaded(decodedData));
      } else {
        emit(PODetailsError(
            'Failed to load PO details. Status: ${response.statusCode}'));
      }
    } catch (e) {
      emit(PODetailsError('Network error: $e'));
    }
  }
}
