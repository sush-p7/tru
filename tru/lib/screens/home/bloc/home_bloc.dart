import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    // Explicitly register the event handler
    on<ChangeDropdownEvent>(_onChangeDropdown);
  }

  void _onChangeDropdown(
    ChangeDropdownEvent event,
    Emitter<HomeState> emit,
  ) {
    print('🔍 Selected Value: ${event.selectedValue}');
    emit(state.copyWith(selectedValue: event.selectedValue));
  }
}
