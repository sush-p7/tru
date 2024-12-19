import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';
import 'package:tru/screens/home/bloc/home_bloc.dart';
import 'package:tru/screens/po_detals/bloc/po_detail_bloc.dart';
import 'package:tru/screens/po_detals/ui/po_details.dart';
import 'package:tru/widgets/po_card.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({super.key});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  bool existsInTrashCan(ProductCard productCard) =>
      trashCan.contains(productCard);
  List<ProductCard> trashCan = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // Check if we have loaded PO requests
        if (state is POApprovelsLoadedState) {
          log(state.poApprovels.toString());
          List<ProductCard> apiProductData =
              state.poApprovels!.map((poRequest) {
            // Extract PODetails, defaulting to an empty map if null
            final podDetails = poRequest['PODetails'] ?? {};
            //print(podDetails);
            return ProductCard(
              id: (poRequest['PONum']?.toString() ?? 'N/A'),

              // Safely extract data from PODetails or use fallback values
              name: podDetails['EntryPerson'] ?? 'Unknown',

              amount: double.tryParse(
                      podDetails['TotalOrder']?.toString() ?? '0') ??
                  double.tryParse(poRequest['POAmt']?.toString() ?? '0') ??
                  0,

              vendorName: podDetails['VendorName'] ??
                  poRequest['VendorName'] ??
                  'Unknown',
              docTotalCheages: podDetails['DocTotalCharges'] ?? '0.0',
              docTotalTax: podDetails['DocTotalTax'] ?? '0.0',
              docTotalMis: podDetails['DocTotalMisc'] ?? '0.0',
              docTotalOrder: podDetails['DocTotalOrder'] ?? '0.0',
            );
          }).toList();

          //print(state.poApprovels);

          return Scaffold(
            body: ListView(
              children: [
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: apiProductData.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 1),
                  itemBuilder: (BuildContext context, int index) {
                    ProductCard currentProduct = apiProductData[index];
                    return BlocConsumer<HomeBloc, HomeState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is NavigateToPODetailsState) {
                          context
                              .read<HomeBloc>()
                              .add(NavigateToPODetailsEvent(currentProduct.id));
                        }
                      },
                      builder: (context, state) {
                        return PrettyCard(
                          name: currentProduct.name,
                          id: currentProduct.id,
                          amount: currentProduct.amount,
                          isSelected: trashCan.contains(currentProduct),
                          trashCan: trashCan,
                          vendorName: currentProduct.vendorName,
                          docTotalCheages: currentProduct.docTotalCheages,
                          docTotalMis: currentProduct.docTotalMis,
                          docTotalOrder: currentProduct.docTotalOrder,
                          docTotalTax: currentProduct.docTotalTax,
                          onTap: () {
                            // context.read<PODetailsBloc>().add(FetchPODetails(
                            //     company: "JWL", poNumber: currentProduct.id));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => PODetailsBloc()
                                    ..add(FetchPODetails(
                                      company: "JWL",
                                      poNumber: currentProduct.id,
                                    )),
                                  child: PODetails(
                                    id: currentProduct.id,
                                    product: currentProduct,
                                  ),
                                ),
                              ),
                            );
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => PODetails(
                            //               id: currentProduct.id,
                            //               product: currentProduct,
                            //             )));
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => BlocProvider(
                            //       create: (context) => PODetailsBloc()
                            //         ..add(
                            //           FetchPODetails(
                            //             poNumber: currentProduct.id,
                            //             company: "JWL",
                            //           ),
                            //         ),
                            //       child: PODetails(
                            //         id: currentProduct.id,
                            //         product: currentProduct,
                            //       ),
                            //     ),
                            //   ),
                            // );
                            // context.read<HomeBloc>().add(
                            //     NavigateToPODetailsEvent(currentProduct.id));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Single Tap!'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          onDelete: () {
                            if (trashCan.contains(apiProductData[index])) {
                              trashCan.remove(apiProductData[index]);
                              setState(() {});
                            } else {
                              trashCan.add(apiProductData[index]);
                              setState(() {});
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar: trashCan.isNotEmpty
                ? BottomAppBar(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                // Remove all selected items from apiProductData
                                apiProductData.removeWhere(
                                    (product) => trashCan.contains(product));
                                trashCan.clear();
                              });
                            },
                            icon: const Icon(
                              Ionicons.checkmark_circle,
                              color: Colors.green,
                              size: 40,
                            )),
                        IconButton(
                          icon: const Icon(
                            Ionicons.trash_bin,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              // Remove all selected items from apiProductData
                              apiProductData.removeWhere(
                                  (product) => trashCan.contains(product));
                              trashCan.clear();
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Ionicons.close_outline,
                              size: 30, color: AppColors.primaryText),
                          onPressed: () async {},
                        ),
                      ],
                    ),
                  )
                : null,
          );
        }
        if (state is PORequestsLoadedState) {
          // Convert API data to ProductCard if needed
          List<ProductCard> apiProductData = state.poRequests?.map((poRequest) {
                return ProductCard(
                  id: poRequest['PONum'].toString() ?? 'N/A',
                  name: poRequest['EntryPerson'] ?? 'Unknown',
                  amount: double.tryParse(
                          poRequest['TotalOrder']?.toString() ?? '0') ??
                      0,
                  vendorName: poRequest['VendorName'] ?? 'Unknown',
                  docTotalCheages: poRequest['DocTotalCharges'] ?? '0.0',
                  docTotalTax: poRequest['DocTotalTax'] ?? '0.0',
                  docTotalMis: poRequest['DocTotalMisc'] ?? '0.0',
                  docTotalOrder: poRequest['DocTotalOrder'] ?? '0.0',
                );
              }).toList() ??
              [];

          return Scaffold(
            body: ListView(
              children: [
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: apiProductData.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 1),
                  itemBuilder: (BuildContext context, int index) {
                    ProductCard currentProduct = apiProductData[index];
                    return BlocConsumer<HomeBloc, HomeState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is NavigateToPODetailsState) {
                          context
                              .read<HomeBloc>()
                              .add(NavigateToPODetailsEvent(currentProduct.id));
                        }
                      },
                      builder: (context, state) {
                        return PrettyCard(
                          name: currentProduct.name,
                          id: currentProduct.id,
                          amount: currentProduct.amount,
                          isSelected: trashCan.contains(currentProduct),
                          trashCan: trashCan,
                          vendorName: currentProduct.vendorName,
                          docTotalCheages: currentProduct.docTotalCheages,
                          docTotalMis: currentProduct.docTotalMis,
                          docTotalOrder: currentProduct.docTotalOrder,
                          docTotalTax: currentProduct.docTotalTax,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PODetails(
                                          id: currentProduct.id,
                                          product: currentProduct,
                                        )));

                            // context.read<HomeBloc>().add(
                            //     NavigateToPODetailsEvent(currentProduct.id));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Single Tap!'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          onDelete: () {
                            if (trashCan.contains(apiProductData[index])) {
                              trashCan.remove(apiProductData[index]);
                              setState(() {});
                            } else {
                              trashCan.add(apiProductData[index]);
                              setState(() {});
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar: trashCan.isNotEmpty
                ? BottomAppBar(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                // Remove all selected items from apiProductData
                                apiProductData.removeWhere(
                                    (product) => trashCan.contains(product));
                                trashCan.clear();
                              });
                            },
                            icon: const Icon(
                              Ionicons.checkmark_circle,
                              color: Colors.green,
                              size: 40,
                            )),
                        IconButton(
                          icon: const Icon(
                            Ionicons.trash_bin,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              // Remove all selected items from apiProductData
                              apiProductData.removeWhere(
                                  (product) => trashCan.contains(product));
                              trashCan.clear();
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Ionicons.close_outline,
                              size: 30, color: AppColors.primaryText),
                          onPressed: () async {},
                        ),
                      ],
                    ),
                  )
                : null,
          );
        } else if (state is PORequestsLoadingState) {
          // Show loading indicator when data is being fetched
          return const Center(child: CircularProgressIndicator());
        } else if (state is PORequestsErrorState) {
          // Show error message if API call fails
          return Center(
            child: Text(
              state.errorMessage ?? 'Failed to load PO Requests',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        // Fallback state
        return const Center(child: Text('No data available'));
      },
    );
  }
}

class PrettyCard extends StatefulWidget {
  final String name;
  final String id;
  final double amount;
  final bool isSelected;
  final String vendorName;
  final void Function()? onDelete;
  final void Function()? onTap;
  final List trashCan;
  final String docTotalCheages;
  final String docTotalTax;
  final String docTotalMis;
  final String docTotalOrder;

  const PrettyCard(
      {super.key,
      required this.name,
      required this.isSelected,
      this.onDelete,
      this.onTap,
      required this.trashCan,
      required this.id,
      required this.amount,
      required this.vendorName,
      required this.docTotalCheages,
      required this.docTotalTax,
      required this.docTotalMis,
      required this.docTotalOrder});

  @override
  State<PrettyCard> createState() => _PrettyCardState();
}

class _PrettyCardState extends State<PrettyCard> {
  List<dynamic> jsonList = [];
  bool isLoading = true;
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        color: widget.isSelected
            ? Colors.grey.shade300
            : AppColors.border, // Visual feedback
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: widget.isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),

        child: ListTile(
          dense: true,
          onTap: widget.trashCan.isNotEmpty ? widget.onDelete : widget.onTap,
          onLongPress: widget.onDelete, // This should trigger the selection
          title: widget.isSelected
              ? SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(color: AppColors.primaryText),
                      ),
                    ],
                  ),
                )
              : POCardSumerry(
                  poNum: widget.id,
                  name: widget.name,
                  amount: widget.amount,
                  vendorName: widget.vendorName,
                  docTotalCheages: widget.docTotalCheages,
                  docTotalMis: widget.docTotalMis,
                  docTotalOrder: widget.docTotalOrder,
                  docTotalTax: widget.docTotalTax,
                  // poData: widget.poData,
                ),
          // Add a trailing widget to show selection state
          trailing: widget.isSelected
              ? const Icon(Icons.check_circle, color: Colors.blue)
              : null,
        ),
      ),
    );
  }
}

class ProductCard {
  final String id;
  final String name;
  final double amount;
  final String vendorName;
  final String docTotalCheages;
  final String docTotalTax;
  final String docTotalMis;
  final String docTotalOrder;

  ProductCard({
    required this.docTotalCheages,
    required this.docTotalTax,
    required this.docTotalMis,
    required this.docTotalOrder,
    required this.id,
    required this.name,
    required this.amount,
    required this.vendorName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCard &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
