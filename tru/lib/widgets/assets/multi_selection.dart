import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({super.key});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  existsInTrashCan(Course course) => trashCan.contains(course);
  List<Course> trashCan = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: trashCan.isEmpty
          ? AppBar(
              title: Text(
                'PO List',
                style: GoogleFonts.inter(
                    fontSize: 25,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w800),
              ),
              centerTitle: true,
              // backgroundColor: AppColors.background,
            )
          : AppBar(
              backgroundColor: AppColors.primaryText,
              leading: IconButton(
                // color: Colors.white,
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    trashCan.clear();
                  });
                },
              ),
              title: Text(trashCan.length.toString()),
              actions: [
                IconButton(
                    onPressed: () {
                      coursesData
                          .removeWhere((item) => trashCan.contains(item));
                      trashCan.clear();
                      setState(() {});
                    },
                    icon: const Icon(
                      Ionicons.checkmark_circle,
                      color: Colors.green,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      coursesData
                          .removeWhere((item) => trashCan.contains(item));
                      trashCan.clear();
                      setState(() {});
                    },
                    icon: const Icon(
                      Ionicons.close_circle,
                      color: Colors.red,
                      size: 40,
                    ))
              ],
            ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: coursesData.length,
            separatorBuilder: (context, index) => const SizedBox(height: 1),
            itemBuilder: (BuildContext context, int index) {
              return PrettyCard(
                name: coursesData[index].name,
                isSelected: existsInTrashCan(coursesData[index]),
                trashCan: trashCan,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Single Tap!'),
                    duration: Duration(seconds: 1),
                  ));
                },
                onDelete: () {
                  if (trashCan.contains(coursesData[index])) {
                    trashCan.remove(coursesData[index]);
                    setState(() {});
                  } else {
                    trashCan.add(coursesData[index]);
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class PrettyCard extends StatelessWidget {
  final String name;
  final bool isSelected;
  final void Function()? onDelete;
  final void Function()? onTap;
  final List trashCan;

  const PrettyCard(
      {Key? key,
      required this.name,
      required this.isSelected,
      this.onDelete,
      this.onTap,
      required this.trashCan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        // surfaceTintColor: isSelected ? Colors.black : null,
        color: AppColors.primaryText,
        child: ListTile(
          dense: true,
          selected: isSelected,
          onTap: trashCan.isNotEmpty ? onDelete : onTap,
          onLongPress: onDelete,
          selectedColor: Colors.white,
          selectedTileColor: Colors.grey,
          title: Text(
            name,
            style: const TextStyle(color: AppColors.white),
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.cyan.shade50,
                  width: 3,
                  style: isSelected ? BorderStyle.solid : BorderStyle.none)),
        ),
      ),
    );
  }
}

class Course {
  final String id;
  final String name;
  Course({
    required this.id,
    required this.name,
  });
}

List<Course> coursesData = [
  Course(id: '1', name: 'MTH'),
  Course(id: '2', name: 'STS'),
  Course(id: '3', name: 'ACC'),
  Course(id: '4', name: 'ETH'),
  Course(id: '5', name: 'PHY'),
  Course(id: '6', name: 'CSC'),
  Course(id: '7', name: 'MTH'),
  Course(id: '8', name: 'STS'),
  Course(id: '9', name: 'ACC'),
  Course(id: '10', name: 'ETH'),
  Course(id: '11', name: 'PHY'),
  Course(id: '12', name: 'CSC'),
];
