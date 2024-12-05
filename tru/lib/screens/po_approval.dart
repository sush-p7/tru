import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';
import 'package:tru/model/my_data.dart';
import 'package:tru/widgets/app_bar.dart';
import 'package:tru/widgets/assets/btn.dart';
import 'package:tru/widgets/assets/multi_selection.dart';
import 'package:tru/widgets/side_menu_app.dart';

class PoApprovel extends StatefulWidget {
  const PoApprovel({super.key});

  @override
  State<PoApprovel> createState() => _PoApprovelState();
}

class _PoApprovelState extends State<PoApprovel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map> staticData = MyData.data;
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
      key: _scaffoldKey,
      drawer: const NavDrawer(),
      appBar: const AppBarCustom(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PO Management",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w500),
                ),
                // const SizedBox(height: 5),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    itemHeight: 80,
                    icon: const Icon(
                      Ionicons.caret_down_outline,
                      color: AppColors.primaryText,
                    ),
                    value: selectedValue,
                    items: poOptions.map((Map<String, String> option) {
                      return DropdownMenuItem<String>(
                        value: option['value'],
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            option['label']!,
                            style: GoogleFonts.inter(
                              fontSize: 45,
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
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
                // const SizedBox(height: 5),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ),
              ],
            ),
          ),
          // Main content fills the remaining space
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              color: Colors.green,
              child: const MultiSelect(),
            ),
          ),
        ],
      ),
    );
  }
}
