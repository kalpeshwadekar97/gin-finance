import 'package:flutter/material.dart';

class Helper {
  static showSnackbar(BuildContext context, String msg, String actionLabel) {
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
              label: actionLabel,
              onPressed: scaffold.hideCurrentSnackBar)),
    );
  }

  static getCurrentDate() {
    return DateTime.now();
  }

  static getCurrentTime() {
    return TimeOfDay.now();
  }

  static isAndroid(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.android;
  }

  static String suffixWithZero(int num) {
    if (num < 10) {
      return "0" + num.toString();
    } else {
      return num.toString();
    }
  }
}
