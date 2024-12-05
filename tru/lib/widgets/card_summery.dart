import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';
import 'package:tru/widgets/po_list.dart';

class CustomPOCard extends StatefulWidget {
  const CustomPOCard({super.key});

  @override
  State<CustomPOCard> createState() => _CustomPOCardState();
}

class _CustomPOCardState extends State<CustomPOCard> {
  final List<FoodItem> foodItems = [
    FoodItem(
        id: '01',
        code: 'JWL-SCE-00001',
        name: 'Chicken Nuggets',
        price: 'xx,xx,xxx/-'),
    FoodItem(
        id: '02',
        code: 'JWL-SCE-00002',
        name: 'Fish Fingers',
        price: 'yy,yy,yyy/-'),
    FoodItem(
        id: '03',
        code: 'JWL-SCE-00003',
        name: 'Veggie Patties',
        price: 'zz,zz,zzz/-'),
    FoodItem(
        id: '04',
        code: 'JWL-SCE-00004',
        name: 'French Fries',
        price: 'aa,aa,aaa/-'),
    FoodItem(
        id: '05',
        code: 'JWL-SCE-00005',
        name: 'Paneer Sticks',
        price: 'bb,bb,bbb/-'),
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
                    "61517",
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
                      "SOLAE COMPANY INDIA PRIVATE LIMITED ",
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
                      "SUJEET G",
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
                        Flexible(
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
                        "XX,XX,XXX/- ",
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
                        "XX,XX,XXX/-",
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
                        "XX,XX,XXX/-",
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
                        "XX,XX,XXX/-",
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

// Example of how to use the custom widget in a Scaffold