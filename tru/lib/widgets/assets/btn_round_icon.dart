import 'package:flutter/material.dart';

import 'package:tru/assets/app_colors.dart';

class BtnRoundIcon extends StatelessWidget {
  final double iconWidth;
  final double iconHeight;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final Icon customIcon;
  final double iconSize;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  const BtnRoundIcon({
    super.key,
    required this.iconWidth,
    required this.iconHeight,
    required this.customIcon,
    required this.iconSize,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 3.0,
    this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: iconWidth,
              height: iconHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor ?? AppColors.primaryText,
                  width: borderWidth,
                ),
                color: backgroundColor,
              ),
            ),
            Icon(
              customIcon.icon,
              size: iconSize,
              color: customIcon.color,
            ),
          ],
        ),
      ),
    );
  }
}
