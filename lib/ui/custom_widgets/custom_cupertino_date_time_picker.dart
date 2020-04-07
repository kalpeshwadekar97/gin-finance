import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';
import 'package:gin_finance/constants/strings.dart';

class CustomCupertinoDateTimePicker extends StatelessWidget {
  final bool _isDate;
  final Function _callback;

  CustomCupertinoDateTimePicker(this._isDate, this._callback);

  @override
  Widget build(BuildContext context) {
    var _selectedDateTime;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Colors.black87,
            blurRadius: 10.0,
          ),
        ]),
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          Strings.LABEL_CANCEL,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_selectedDateTime != null)
                          _callback(_selectedDateTime);
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          Strings.LABEL_DONE,
                          style: Theme.of(context).textTheme.title.copyWith(
                              color: Color(ColorPalette.ACCENT_COLOR),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: _isDate
                      ? CupertinoDatePicker(
                          minimumDate: DateTime.now(),
                          maximumDate: DateTime(2030),
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (date) {
                            _selectedDateTime = date;
                          })
                      : CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hm,
                          onTimerDurationChanged: (time) {
                            _selectedDateTime = time;
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
