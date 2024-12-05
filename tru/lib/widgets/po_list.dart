import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tru/assets/app_colors.dart';

// Food Item Model
class FoodItem {
  final String id;
  final String code;
  final String name;
  final String price;

  FoodItem({
    required this.id,
    required this.code,
    required this.name,
    required this.price,
  });
}

class CustomFoodList extends StatelessWidget {
  // List of food items
  final List<FoodItem> foodItems;

  const CustomFoodList({
    super.key,
    required this.foodItems,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true, // Important for nested scrolling
              physics:
                  const AlwaysScrollableScrollPhysics(), // Ensures scrollability
              itemCount: foodItems.length,
              separatorBuilder: (context, index) => const Divider(
                // color: Colors.grey[300],
                height: 0,
                thickness: 0,
              ),
              itemBuilder: (context, index) {
                final item = foodItems[index];
                return Container(
                  // height: 100,
                  decoration: BoxDecoration(
                    // color: AppColors.primaryText, // Move color here
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      '${item.id} - ${item.code}',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      '${item.name} - ${item.price}',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w500),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage in a main screen
class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data
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

    return CustomFoodList(foodItems: foodItems);
  }
}
