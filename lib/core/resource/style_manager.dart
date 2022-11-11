import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, double fontHeight) {
  return GoogleFonts.poppins(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
    height: fontHeight,
  );
}

TextStyle getRegularStyle(
    {double fontSize = 12, required Color color, double fontHeight = 1}) {
  return _getTextStyle(fontSize, FontWightManager.regular, color, fontHeight);
}

// Text light style
TextStyle getLightStyle(
    {double fontSize = 12, required Color color, double fontHeight = 1}) {
  return _getTextStyle(fontSize, FontWightManager.light, color, fontHeight);
}

// Text style bold
TextStyle getBoldStyle(
    {double fontSize = 12, required Color color, double fontHeight = 1}) {
  return _getTextStyle(fontSize, FontWightManager.bold, color, fontHeight);
}

// Text style semi bold
TextStyle getSemiBoldStyle(
    {double fontSize = 12, required Color color, double fontHeight = 1}) {
  return _getTextStyle(fontSize, FontWightManager.semiBold, color, fontHeight);
}

// Text style medium
TextStyle getMediumStyle(
    {double fontSize = 12, required Color color, double fontHeight = 1}) {
  return _getTextStyle(fontSize, FontWightManager.medium, color, fontHeight);
}
