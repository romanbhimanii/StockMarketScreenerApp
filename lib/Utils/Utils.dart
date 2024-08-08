import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils{

  static Widget text(
      {String? text,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines}) {
    return Text(
      text ?? "",
      style: GoogleFonts.inter(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
      textAlign: textAlign,
      overflow: textOverFlow,
      maxLines: maxLines,
    );
  }
}