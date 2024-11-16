import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tru/assets/app_colors.dart';

class BtnPrimary extends StatelessWidget {
  final String btnText;
  final double txtBoxFontSize;
  final double? btnWidth;
  final double? btnHeight;
  final VoidCallback? callback;

  const BtnPrimary(
      {super.key,
      required this.btnText,
      required this.txtBoxFontSize,
      this.btnWidth,
      this.btnHeight,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, top: 10),
      child: SizedBox(
        width: btnWidth ?? 150,
        height: btnHeight ?? 50,
        child: ElevatedButton(
          clipBehavior: Clip.antiAlias,
          onPressed: callback,
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.primaryText)),
          child: Text(
            btnText,
            style: GoogleFonts.inter(
                fontSize: txtBoxFontSize,
                color: AppColors.white,
                fontWeight: FontWeight.w700),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
