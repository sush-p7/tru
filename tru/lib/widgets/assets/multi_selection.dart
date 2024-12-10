import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';
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
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: productData.length,
            separatorBuilder: (context, index) => const SizedBox(height: 1),
            itemBuilder: (BuildContext context, int index) {
              ProductCard currentProduct = productData[index];
              return PrettyCard(
                name: currentProduct.name,
                id: currentProduct.id,
                amount: currentProduct.amount,
                isSelected: trashCan.contains(currentProduct),
                trashCan: trashCan,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PODetails()));

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Single Tap!'),
                    duration: Duration(seconds: 1),
                  ));
                },
                onDelete: () {
                  if (trashCan.contains(productData[index])) {
                    trashCan.remove(productData[index]);
                    setState(() {});
                  } else {
                    trashCan.add(productData[index]);
                    setState(() {});
                  }
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
                          // Remove all selected items from productData
                          productData.removeWhere(
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
                        // Remove all selected items from productData
                        productData.removeWhere(
                            (product) => trashCan.contains(product));
                        trashCan.clear();
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Ionicons.close_outline,
                        size: 30, color: AppColors.primaryText),
                    onPressed: () async {
                      final FlutterSecureStorage storage =
                          FlutterSecureStorage();

                      const String url =
                          'https://erp-application.jwllogic.com/e11dev2100/api/v1/Erp.BO.POSvc/POes';

                      final token = await storage.read(key: 'AccessToken');

                      try {
                        final data =
                            await sendGetRequest(url: url, token: token);
                        print('Data received: $data');
                      } catch (e) {
                        print('Error: $e');
                      }
                      setState(() {
                        trashCan.clear();
                      });
                    },
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

class PrettyCard extends StatefulWidget {
  final String name;
  final String id;
  final double amount;
  final bool isSelected;
  final void Function()? onDelete;
  final void Function()? onTap;
  final List trashCan;

  const PrettyCard(
      {super.key,
      required this.name,
      required this.isSelected,
      this.onDelete,
      this.onTap,
      required this.trashCan,
      required this.id,
      required this.amount});

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
              : const POCardSumerry(
                  poNum: 77,
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

class ProductCard {
  final String id;
  final String name;
  final double amount;

  ProductCard({
    required this.id,
    required this.name,
    required this.amount,
  });
}

List<ProductCard> productData = [
  ProductCard(id: 'JWL-SCE-00001', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-00002', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-00003', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-00004', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-00005', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-00006', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-00007', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-00008', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-00009', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-000010', name: 'Chicken Nuggets', amount: 23456),
  ProductCard(id: 'JWL-SCE-000011', name: 'Chicken Nuggets', amount: 23456),
];

//temp code

Future<dynamic> sendGetRequest({
  required String url,
  required final token,
}) async {
  final FlutterSecureStorage storage;
  final http.Client httpClient;
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Successful response
      return jsonDecode(response.body);
    } else {
      // Handle errors
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network or parsing errors
    throw Exception('Error: $e');
  }
}
