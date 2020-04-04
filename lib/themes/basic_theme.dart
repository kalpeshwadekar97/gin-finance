import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';

ThemeData basicTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(ColorPalette.PRIMARY_COLOR),
    accentColor: Color(ColorPalette.ACCENT_COLOR),
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700),
      subhead: TextStyle(fontSize: 24.0),
      title: TextStyle(fontSize: 20.0),
      subtitle: TextStyle(fontSize: 18.0),
      body1: TextStyle(fontSize: 16.0, color: Colors.grey),
      button: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500)
    ),
  );
}