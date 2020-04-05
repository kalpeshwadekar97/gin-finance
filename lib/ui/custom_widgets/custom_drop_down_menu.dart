import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String _labelText;
  final List<String> _data;
  final Function _callback;

  CustomDropDownMenu(this._labelText, this._data, this._callback);

  @override
  _CustomDropDownMenuState createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  var _dropdownValue;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget._data[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget._labelText,
            style: Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(color: Colors.grey, fontSize: 14.0),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 30.0,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  iconEnabledColor: Colors.grey,
                  value: _dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      _dropdownValue = value;
                    });
                    widget._callback(value);
                  },
                  items: widget._data
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.black, fontSize: 16.0),
                      ),
                    );
                  }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
