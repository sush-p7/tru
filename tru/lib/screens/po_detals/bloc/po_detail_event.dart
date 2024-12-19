part of 'po_detail_bloc.dart';

// sealed class PoDetailEvent extends Equatable {
//   const PoDetailEvent();

//   @override
//   List<Object> get props => [];
// }

abstract class PODetailsEvent extends Equatable {
  const PODetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchPODetails extends PODetailsEvent {
  final String poNumber;
  final String company;

  const FetchPODetails({required this.poNumber, required this.company});

  @override
  List<Object> get props => [poNumber, company];
}
