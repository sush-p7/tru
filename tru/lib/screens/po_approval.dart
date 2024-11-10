import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';
import 'package:tru/widgets/app_bar.dart';
import 'package:tru/widgets/assets/btn.dart';

class PoApprovel extends StatefulWidget {
  const PoApprovel({super.key});

  @override
  State<PoApprovel> createState() => _PoApprovelState();
}

class _PoApprovelState extends State<PoApprovel> {
  final List<Map<String, String>> poOptions = [
    {'value': 'Approvels', 'label': 'My Approvels'},
    {'value': 'Requests', 'label': 'My Requests'},
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = 'Approvels'; // Set default value
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PO Management",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 5),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: const Icon(
                              Ionicons.caret_down_outline,
                              color: AppColors.primaryText,
                            ),
                            value: selectedValue,
                            style: const TextStyle(),
                            //isExpanded: true,
                            items: poOptions.map((Map<String, String> option) {
                              return DropdownMenuItem<String>(
                                value: option['value'],
                                child: Text(
                                  option['label']!,
                                  style: GoogleFonts.inter(
                                      fontSize: 40,
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.w800),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue;
                              });
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Row(
                            children: [
                              BtnPrimary(
                                btnText: 'All PO',
                                txtBoxFontSize: 10,
                                btnHeight: 30,
                                btnWidth: 80,
                              ),
                              BtnPrimary(
                                btnText: 'Pending',
                                txtBoxFontSize: 10,
                                btnHeight: 30,
                                btnWidth: 90,
                              ),
                              BtnPrimary(
                                btnText: 'Approved',
                                txtBoxFontSize: 10,
                                btnHeight: 30,
                                btnWidth: 97,
                              ),
                              BtnPrimary(
                                btnText: 'Rejected',
                                txtBoxFontSize: 10,
                                btnHeight: 30,
                                btnWidth: 92,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
