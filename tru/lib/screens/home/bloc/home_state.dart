part of 'home_bloc.dart';

// sealed class HomeState extends Equatable {
//   const HomeState();

//   @override
//   List<Object> get props => [];
// }

class HomeState extends Equatable {
  final String selectedValue;
  final List<Map<String, String>> dropdownOptions;

  const HomeState({
    this.selectedValue = 'Approvels',
    this.dropdownOptions = const [
      {'value': 'Approvels', 'label': 'My Approvels'},
      {'value': 'Requests', 'label': 'My Requests'},
    ],
  });

  HomeState copyWith({
    String? selectedValue,
    List<Map<String, String>>? dropdownOptions,
  }) {
    return HomeState(
      selectedValue: selectedValue ?? this.selectedValue,
      dropdownOptions: dropdownOptions ?? this.dropdownOptions,
    );
  }

  @override
  List<Object> get props => [selectedValue, dropdownOptions];
}
