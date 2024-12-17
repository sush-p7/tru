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

class FetchPOApprovelsEvent extends HomeEvent {
  const FetchPOApprovelsEvent();
}

class NavigateToPODetailsEvent extends HomeEvent {
  final String poId;
  NavigateToPODetailsEvent(this.poId);
}

class LoadPORequestsEvent extends HomeEvent {
  final String poId;
  const LoadPORequestsEvent(this.poId);
}
