import 'package:flutter/material.dart';

class GinFinanceTextFormField extends StatefulWidget {
  final TextInputType keyboardType;
  final Icon icon;
  final String labelText;
  final String hintText;
  final Function validator;

  GinFinanceTextFormField(this.labelText, this.hintText, this.icon,
      this.keyboardType, this.validator);

  @override
  _GinFinanceInputTextState createState() => _GinFinanceInputTextState();
}

class _GinFinanceInputTextState extends State<GinFinanceTextFormField> {
  var _text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          icon: widget.icon,
          border: InputBorder.none,
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.body1
      ),
      validator: (String value) {
        return widget.validator(value);
      },
      onSaved: (String val) {
        _text = val;
      },
    );
  }
}
