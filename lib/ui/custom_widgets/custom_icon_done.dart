import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';

class CustomIconDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        borderRadius: new BorderRadius.circular(25.0),
        color: Color(ColorPalette.ACCENT_COLOR),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Icon(Icons.done),
        ));
  }
}
