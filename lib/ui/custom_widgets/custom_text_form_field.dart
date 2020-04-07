import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final Icon prefixIcon;
  final String hintText;
  final Function validator;

  CustomTextFormField(
      this.hintText, this.prefixIcon, this.keyboardType, this.validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.title.copyWith(color: Colors.black),
      decoration: InputDecoration(
          errorStyle: Theme.of(context)
              .textTheme
              .subtitle
              .copyWith(color: Colors.red, fontSize: 15),
          prefixIcon: prefixIcon,
          focusedBorder: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: const BorderSide(
                color: Color(ColorPalette.BACKGROUND_WHITE), width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.body1,
          fillColor: Color(ColorPalette.BACKGROUND_WHITE),
          filled: true),
      validator: (String value) {
        return validator(value);
      },
    );
  }
}
