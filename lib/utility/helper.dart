import 'package:flutter/material.dart';

class Helper{
  static showToast(BuildContext context, String msg, String actionLable) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            msg,
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          action: SnackBarAction(
              textColor: Colors.black,
              label: actionLable,
              onPressed: scaffold.hideCurrentSnackBar)),
    );
  }
}