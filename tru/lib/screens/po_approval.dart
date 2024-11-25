import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';
import 'package:tru/model/my_data.dart';
import 'package:tru/widgets/app_bar.dart';
import 'package:tru/widgets/assets/btn.dart';
import 'package:tru/widgets/assets/multi_selection.dart';

class PoApprovel extends StatefulWidget {
  const PoApprovel({super.key});

  @override
  State<PoApprovel> createState() => _PoApprovelState();
}

class _PoApprovelState extends State<PoApprovel> {
  List<Map> staticData = MyData.data;
  final List<Map<String, String>> poOptions = [
    {'value': 'Approvels', 'label': 'My Approvels'},
    {'value': 'Requests', 'label': 'My Requests'},
  ];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedValue = 'Approvels'; // Set default value
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBarCustom(
        openDrower: _openDrower,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
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

  void _openDrower() {
    Scaffold.of(context).openDrawer();
  }
}
