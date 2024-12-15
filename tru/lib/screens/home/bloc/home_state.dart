part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  final String selectedValue;
  final bool showSnackbar;
  final String snackbarMessage;
  final bool isLoading;
  final List<dynamic>? poRequests;
  final String? errorMessage;
  const HomeState({
    this.selectedValue = 'Approvels',
    this.showSnackbar = false,
    this.snackbarMessage = '',
    this.isLoading = false,
    this.poRequests,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        selectedValue,
        showSnackbar,
        snackbarMessage,
        isLoading,
        poRequests,
        errorMessage
      ];
}

final class HomeInitial extends HomeState {
  const HomeInitial()
      : super(
            selectedValue: 'Approvels',
            showSnackbar: false,
            snackbarMessage: '');
}

class DropdownChangedState extends HomeState {
  const DropdownChangedState(
      {required String selectedValue,
      bool showSnackbar = true,
      String? snackbarMessage})
      : super(
          selectedValue: selectedValue,
          showSnackbar: showSnackbar,
          snackbarMessage: snackbarMessage ??
              (selectedValue == 'Approvels'
                  ? 'You selected My Approvals'
                  : 'You selected My Requests'),
        );
}

class PORequestsLoadingState extends HomeState {
  const PORequestsLoadingState({
    required super.selectedValue,
  }) : super(
          isLoading: true,
        );
}

class PORequestsLoadedState extends HomeState {
  const PORequestsLoadedState({
    required super.selectedValue,
    required List<dynamic> super.poRequests,
  });
}

class PORequestsErrorState extends HomeState {
  const PORequestsErrorState({
    required super.selectedValue,
    required String super.errorMessage,
  }) : super(isLoading: false);
}
