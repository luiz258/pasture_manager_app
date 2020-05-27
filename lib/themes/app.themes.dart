import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color(0xFF27AE60);
const accentColor = const Color(0xFF000000);
const grayColor = const Color(0xFFF5F5F5);
const blueColorT = const Color(0xFF1473E6);
const backgroundColor= const Color(0xFFFFFFFF);
ThemeData appTheme() {
  return ThemeData(
    brightness: brightness,
    
    cardColor: grayColor,
    primaryColor: primaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: backgroundColor,
    //splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}