import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';
import 'package:gin_finance/constants/constants.dart';
import 'package:gin_finance/ui/custom_widgets/custom_cupertino_date_time_picker.dart';
import 'package:gin_finance/utility/helper.dart';

class CustomDateTimePicker extends StatelessWidget {
  final String _isFrom;
  final String _label;
  final String _hint;
  final Function _callback;

  CustomDateTimePicker(this._isFrom, this._label, this._hint, this._callback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isFrom == Constants.PICK_DATE
            ? _selectDate(context)
            : _selectTime(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _label,
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.grey, fontSize: 14.0),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _hint,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.black, fontSize: 16.0),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    if (Helper.isAndroid(context)) {
      var currentDate = DateTime.now();
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: DateTime(
              currentDate.year, currentDate.month, currentDate.day + 1),
          firstDate: Helper.getCurrentDate(),
          lastDate: DateTime(2030));
      if (picked != null) _callback(picked);
    } else {
      getCupertinoDatePicker(context, true);
    }
  }

  _selectTime(BuildContext context) async {
    if (Helper.isAndroid(context)) {
      TimeOfDay t = await showTimePicker(
          context: context, initialTime: Helper.getCurrentTime());
      if (t != null) _callback(t);
    } else {
      getCupertinoDatePicker(context, false);
    }
  }

  getCupertinoDatePicker(BuildContext context, bool isDate) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Color(ColorPalette.TRANSPARENT_BACKGROUND),
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return CustomCupertinoDateTimePicker(isDate, (selectedDate) {
            _callback(selectedDate);
          });
        });
  }
}
