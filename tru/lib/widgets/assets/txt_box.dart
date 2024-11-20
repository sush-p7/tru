import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tru/assets/app_colors.dart';

class TxtRoundedFill extends StatelessWidget {
  final String hintText;
  final String txtBoxLabel;
  final double txtBoxWidth;
  final double txtBoxFontSize;
  final double txtBoxBorderRadius;
  final String? txtBoxhelperText;
  final bool isPassword;
  final TextEditingController? textEditingController;

  const TxtRoundedFill(
      {super.key,
      required this.hintText,
      required this.txtBoxLabel,
      required this.txtBoxWidth,
      required this.txtBoxFontSize,
      required this.txtBoxBorderRadius,
      this.txtBoxhelperText,
      required this.isPassword,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 266,
        child: TextField(
          controller: textEditingController,
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: txtBoxLabel,
            hintStyle: GoogleFonts.inter(
                fontSize: txtBoxFontSize,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400),
            hintText: hintText,
            helperText: txtBoxhelperText,
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(txtBoxBorderRadius))),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(txtBoxBorderRadius)),
              borderSide: const BorderSide(
                color: AppColors.border,
                width: 2.0,
              ), // Set focus border color to blue
            ),
          ),
          style: GoogleFonts.inter(
              fontSize: txtBoxFontSize,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w600),
          autocorrect: false,
        ),
      ),
    );
  }
}
