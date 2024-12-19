part of 'po_detail_bloc.dart';

// sealed class PoDetailState extends Equatable {
//   const PoDetailState();

//   @override
//   List<Object> get props => [];
// }

// final class PoDetailInitial extends PoDetailState {}

abstract class PODetailsState extends Equatable {
  const PODetailsState();

  @override
  List<Object> get props => [];
}

class PODetailsInitial extends PODetailsState {}

class PODetailsLoading extends PODetailsState {}

class PODetailsLoaded extends PODetailsState {
  final Map<String, dynamic> poDetails;

  const PODetailsLoaded(this.poDetails);

  @override
  List<Object> get props => [poDetails];
}

class PODetailsError extends PODetailsState {
  final String message;

  const PODetailsError(this.message);

  @override
  List<Object> get props => [message];
}
