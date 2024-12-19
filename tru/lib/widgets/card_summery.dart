import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';
import 'package:tru/widgets/assets/multi_selection.dart';
import 'package:tru/widgets/po_list.dart';

//TODO : This is a used to line details widget
class CustomPOCard extends StatefulWidget {
  final String id;
  final ProductCard product;
  const CustomPOCard({super.key, required this.id, required this.product});

  @override
  State<CustomPOCard> createState() => _CustomPOCardState();
}

class _CustomPOCardState extends State<CustomPOCard> {
  final List<FoodItem> foodItems = [
    FoodItem(
      id: '01',
      code: 'JWL-SCE-00001',
      name: 'Chicken Nuggets',
      price: 'xx,xx,xxx/-',
      qty: '20',
      rate: '75',
    ),
    FoodItem(
      id: '02',
      code: 'JWL-SCE-00002',
      name: 'Fish Fingers',
      price: 'yy,yy,yyy/-',
      qty: '20',
      rate: '75',
    ),
    FoodItem(
      id: '03',
      code: 'JWL-SCE-00003',
      name: 'Veggie Patties',
      price: 'zz,zz,zzz/-',
      qty: '20',
      rate: '75',
    ),
    FoodItem(
      id: '04',
      code: 'JWL-SCE-00004',
      name: 'French Fries',
      price: 'aa,aa,aaa/-',
      qty: '20',
      rate: '75',
    ),
    FoodItem(
      id: '05',
      code: 'JWL-SCE-00005',
      name: 'Paneer Sticks',
      price: 'bb,bb,bbbcc/-',
      qty: '20',
      rate: '75',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Row at the top of the Column
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Top Row First Item'),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              // padding: EdgeInsets.all(15),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primaryText,
                borderRadius: BorderRadius.circular(50),
              ),
              // color: AppColors.primaryText,
              child: Center(
                  child: Text(
                "01",
                style: GoogleFonts.inter(
                    fontSize: 25,
                    color: AppColors.white,
                    fontWeight: FontWeight.w800),
              )),
            ),
            Expanded(
              child: Column(
                // verticalDirection: ,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.id,
                    style: GoogleFonts.inter(
                        fontSize: 25,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Date : 12-10-2024",
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
            // Text('Top Row Second Item'),
          ],
        ),
        // const SizedBox(
        //   height: 15,
        // ),
        // Second Row with nested Columns
        Container(
          margin: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First nested Column
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Supplier ",
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.product.vendorName,
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      "Buyer ",
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.product.name,
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text('Nested Column 1 - Row 1'),
                        Flexible(
                          child: GestureDetector(
                            onTap: () async {
                              String? result = await showInputDialog(
                                context: context,
                                title: 'Enter Your Comment',
                                hintText: 'Type something here...',
                              );

                              if (result != null && result.isNotEmpty) {
                                // Do something with the result
                                print('Input received: $result');
                              } else {
                                print('No input provided');
                              }
                            },
                            child: Container(
                              width: 70,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.success,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // color: AppColors.primaryText,
                              child: const Center(
                                  child: Icon(
                                Ionicons.checkmark_outline,
                                color: AppColors.white,
                                size: 35,
                              )),
                            ),
                          ),
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 70,
                              height: 50,

                              decoration: BoxDecoration(
                                color: AppColors.error,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // color: AppColors.primaryText,
                              child: const Center(
                                child: Icon(
                                  Ionicons.close_outline,
                                  color: AppColors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // You can add more rows or widgets here
                  ],
                ),
              ),

              // Second nested Column
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Charges ",
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.product.docTotalCheages,
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Misc ",
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.product.docTotalMis,
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Tax ",
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.product.docTotalTax,
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Total ",
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.product.docTotalOrder,
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text('Nested Column 2 - Row 1'),
                        ],
                      ),
                      // You can add more rows or widgets here
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: 1,
          color: AppColors.border,
        ),
        CustomFoodList(
          foodItems: foodItems,
        )
      ],
    );
  }
}

// Future<String?> showInputDialog({
//   required BuildContext context,
//   required String title,
//   String hintText = '',
//   String cancelButtonText = 'Cancel',
//   String submitButtonText = 'Submit',
// }) {
//   String inputValue = '';

//   return showDialog<String>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(title),
//         content: TextField(
//           onChanged: (value) {
//             inputValue = value;
//           },
//           decoration: InputDecoration(
//             hintText: hintText,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close without returning a value
//             },
//             child: Text(cancelButtonText),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(inputValue); // Return the input value
//             },
//             child: Text(submitButtonText),
//           ),
//         ],
//       );
//     },
//   );
// }
Future<String?> showInputDialog({
  required BuildContext context,
  required String title,
  String hintText = '',
  String cancelButtonText = 'Cancel',
  String submitButtonText = 'Submit',
  Color backgroundColor = Colors.white,
  double borderRadius = 15.0,
  BoxShadow? boxShadow,
}) {
  String inputValue = '';

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor:
            Colors.transparent, // Make the dialog background transparent
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              boxShadow ??
                  const BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  inputValue = value;
                },
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Close without returning a value
                    },
                    child: Text(cancelButtonText),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(inputValue); // Return the input value
                    },
                    child: Text(submitButtonText),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
