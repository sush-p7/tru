part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class DropdownChangedEvent extends HomeEvent {
  final String selectedValue;

  const DropdownChangedEvent(this.selectedValue);

  @override
  List<Object> get props => [selectedValue];
}

class FetchPORequestsEvent extends HomeEvent {
  const FetchPORequestsEvent();
}
