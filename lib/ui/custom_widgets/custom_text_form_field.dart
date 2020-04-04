import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';

class GinFinanceTextFormField extends StatefulWidget {
  final TextInputType keyboardType;
  final Icon prefixIcon;
  final String hintText;
  final Function validator;

  GinFinanceTextFormField(
      this.hintText, this.prefixIcon, this.keyboardType, this.validator);

  @override
  _GinFinanceInputTextState createState() => _GinFinanceInputTextState();
}

class _GinFinanceInputTextState extends State<GinFinanceTextFormField> {
  var _text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      style: Theme.of(context).textTheme.title.copyWith(color: Colors.black),
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          focusedBorder: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
            borderSide: const BorderSide(
                color: Color(ColorPalette.BACKGROUND_WHITE), width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.body1,
          fillColor: Color(ColorPalette.BACKGROUND_WHITE),
          filled: true),
      validator: (String value) {
        return widget.validator(value);
      },
      onSaved: (String val) {
        _text = val;
      },
    );
  }
}
