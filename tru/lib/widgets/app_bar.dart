import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:tru/assets/app_colors.dart';
import 'package:tru/widgets/assets/btn_round_icon.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? openDrawer;
  const AppBarCustom({super.key, this.openDrawer});

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return AppBar(
        leadingWidth: 100,
        toolbarHeight: 100,
        centerTitle: true,
        leading: Builder(builder: (context) {
          return BtnRoundIcon(
            iconWidth: 60,
            iconHeight: 60,
            customIcon: const Icon(
              Ionicons.menu_outline,
              color: Colors.white,
            ),
            iconSize: 40,
            backgroundColor: AppColors.primaryText,
            onPressed: () {
              Scaffold.of(context).openDrawer(); // This context now works
            },
          );
        }),
        actions: const [
          BtnRoundIcon(
            iconWidth: 60,
            iconHeight: 60,
            customIcon: Icon(
              Ionicons.notifications,
              color: AppColors.primaryText,
            ),
            iconSize: 30,
            borderWidth: 2,
          ),
          BtnRoundIcon(
            padding: EdgeInsets.only(right: 20, left: 4),
            iconWidth: 60,
            iconHeight: 60,
            customIcon: Icon(
              Ionicons.person,
              color: Colors.white,
            ),
            iconSize: 40,
            backgroundColor: AppColors.primaryText,
          )
        ],
        elevation: 0,
      );
    });
  }
}
