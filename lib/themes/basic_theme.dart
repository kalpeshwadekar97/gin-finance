import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';

ThemeData basicTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(ColorPalette.PRIMARY_COLOR),
    accentColor: Color(ColorPalette.ACCEnt_COLOR),
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0),
    ),
  );
}
