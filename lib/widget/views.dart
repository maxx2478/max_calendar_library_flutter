import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';




Widget headerText(String text, double size, {Color color = Colors.white}) {
  return AutoSizeText(
    text,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color, fontWeight: FontWeight.bold, fontSize: size)),
    minFontSize: size,
  );
}

Widget titleText(String text, double size, {Color textColor = Colors.black, TextAlign textAlign = TextAlign.start}) {
  return AutoSizeText(
    text,
    textAlign: textAlign,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(color: textColor
            , fontSize: size)),
    minFontSize: 10,
    overflow: TextOverflow.ellipsis,
    maxFontSize: size,
  );
}

Widget paragraphText(String text, {double size = 8, Color textColor = Colors.black, TextAlign alignment = TextAlign.start}) {
  return AutoSizeText(
    text,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(color: textColor, fontSize: size,)),
    textAlign: alignment,
    minFontSize: size,
    overflow: TextOverflow.ellipsis,
    softWrap: true,
  );
}
