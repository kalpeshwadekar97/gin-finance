import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gin_finance/constants/constants.dart';
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
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
        firstDate: Helper.getCurrentDate(),
        lastDate: DateTime(2030));
    if (picked != null) _callback(picked);
  }

  _selectTime(BuildContext context) async {
    TimeOfDay t = await showTimePicker(
        context: context, initialTime: Helper.getCurrentTime());
    if (t != null) _callback(t);
  }
}
