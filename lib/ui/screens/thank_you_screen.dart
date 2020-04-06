import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';
import 'package:gin_finance/constants/strings.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.CREATE_ACCOUNT),
      ),
      body: Container(
          color: Color(ColorPalette.PRIMARY_COLOR),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                Strings.THANK_YOU,
                style: Theme.of(context).textTheme.headline,
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}
