import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';

class POCardSumerry extends StatefulWidget {
  final int poNum;
  const POCardSumerry({super.key, required this.poNum});

  @override
  State<POCardSumerry> createState() => _POCardSumerryState();
}

class _POCardSumerryState extends State<POCardSumerry> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    "${widget.poNum}",
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
                        Container(
                          width: 60,
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
                        Container(
                          width: 60,
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
      ],
    );
  }
}
