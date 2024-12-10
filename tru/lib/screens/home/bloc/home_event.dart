part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ChangeDropdownEvent extends HomeEvent {
  final String selectedValue;

  const ChangeDropdownEvent(this.selectedValue);

  @override
  List<Object> get props => [selectedValue];
}
