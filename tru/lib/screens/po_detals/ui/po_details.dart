import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';
import 'package:tru/widgets/assets/multi_selection.dart';
import 'package:tru/widgets/card_summery.dart';

class PODetails extends StatefulWidget {
  final String id;
  final ProductCard product;
  const PODetails({super.key, required this.id, required this.product});

  @override
  State<PODetails> createState() => _PODetailsState();
}

class _PODetailsState extends State<PODetails> {
  final String poNumber = '61571';
  final DateTime poDate = DateTime(2024, 10, 12);

  final String supplier = 'Solar private limited company';
  final String buyer = 'Sujeet G';
  final bool isApproved = true;
  final double charges = 22500.00;
  final double miscellaneous = 2500.00;
  final double tax = 4500.00;
  final double total = 29500.00;
  final List<Map<String, String>> products = [
    {'code': 'JWL-SCE-00001', 'name': 'Chicken Nuggets'},
    {'code': 'JWL-SCE-00001', 'name': 'Chicken Nuggets'},
    {'code': 'JWL-SCE-00001', 'name': 'Chicken Nuggets'},
    {'code': 'JWL-SCE-00001', 'name': 'Chicken Nuggets'},
    {'code': 'JWL-SCE-00001', 'name': 'Chicken Nuggets'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PO Management",
                style: GoogleFonts.inter(
                    fontSize: 15,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Details",
                style: GoogleFonts.inter(
                    fontSize: 45,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                icon: const Icon(
                  Ionicons.arrow_back,
                  size: 50,
                  color: AppColors.primaryText,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        body: CustomPOCard(
          product: widget.product,
          id: widget.id,
        )

        // Container(
        //   margin: EdgeInsets.all(15),
        //   decoration: const BoxDecoration(
        //       color: AppColors.border,
        //       borderRadius: BorderRadius.all(Radius.circular(15))),
        //   padding: const EdgeInsets.all(15),
        //   child: Padding(
        //       padding: EdgeInsets.all(5),
        //       child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             const Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Text(
        //                   "33/33/33",
        //                   style: TextStyle(
        //                     fontSize: 16.0,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             const SizedBox(height: 16.0),
        //             Row(
        //               children: [
        //                 const Text(
        //                   'Supplier: ',
        //                   style: TextStyle(
        //                     fontSize: 16.0,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //                 Text(
        //                   supplier,
        //                   style: const TextStyle(
        //                     fontSize: 16.0,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             const SizedBox(height: 8.0),
        //             Row(
        //               children: [
        //                 const Text(
        //                   'Buyer: ',
        //                   style: TextStyle(
        //                     fontSize: 16.0,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //                 Text(
        //                   buyer,
        //                   style: const TextStyle(
        //                     fontSize: 16.0,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             const SizedBox(height: 16.0),
        //             Row(
        //               children: [
        //                 Text(
        //                   'Supplier: ',
        //                   style: TextStyle(
        //                     fontSize: 16.0,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //                 Text(
        //                   supplier,
        //                   style: TextStyle(
        //                     fontSize: 16.0,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             const SizedBox(height: 8.0),
        //           ])),
        // )

        );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

class _ItemTable extends StatelessWidget {
  final List<_ItemRow> items;

  const _ItemTable({required this.items});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(color: Colors.grey),
        verticalInside: BorderSide(color: Colors.grey),
      ),
      children: items.map((item) => item.toTableRow()).toList(),
    );
  }
}

class _ItemRow {
  final String itemNumber;
  final String itemCode;
  final String itemName;
  final String itemPrice;

  const _ItemRow({
    required this.itemNumber,
    required this.itemCode,
    required this.itemName,
    required this.itemPrice,
  });

  TableRow toTableRow() {
    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(itemNumber),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(itemCode),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(itemName),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(itemPrice),
        ),
      ],
    );
  }
}
