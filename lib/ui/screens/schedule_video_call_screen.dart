import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';
import 'package:gin_finance/constants/constants.dart';
import 'package:gin_finance/constants/strings.dart';
import 'package:gin_finance/ui/animated_icons/calendar.dart';
import 'package:gin_finance/ui/custom_widgets/custom_date_time_picker.dart';
import 'package:gin_finance/ui/custom_widgets/state_progress_bar.dart';
import 'package:gin_finance/utility/helper.dart';

class ScheduleVideoCallScreen extends StatefulWidget {
  @override
  _ScheduleVideoCallScreenState createState() =>
      _ScheduleVideoCallScreenState();
}

class _ScheduleVideoCallScreenState extends State<ScheduleVideoCallScreen> {
  var _selectedDate;
  var _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.CREATE_ACCOUNT),
      ),
      body: Builder(
        builder: (context) => Container(
          color: Theme.of(context).primaryColor,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: StateProgressBar(Constants.totalStateCount,
                            Constants.scheduleVideoCallPageState),
                      ),
                      _getCalendarIcon(),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      _getTitleText(),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      _getSubTitleText(),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      _getDropDownMenu(context),
                      Padding(padding: EdgeInsets.only(bottom: 20))
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _getNextButton(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getCalendarIcon() {
    return Container(
      height: 100,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Color(ColorPalette.CALENDAR_BUTTON_BACKGROUND),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: CalendarIcon(),
        ),
      ),
    );
  }

  _getTitleText() {
    return Text(Strings.SCHEDULE_VIDEO_CALL,
        style: Theme.of(context).textTheme.title);
  }

  _getSubTitleText() {
    return Text(Strings.SCHEDULE_VIDEO_CALL_SUBTITLE,
        style: Theme.of(context)
            .textTheme
            .subtitle
            .copyWith(color: Color(ColorPalette.WHITE_WITH_OPACITY)));
  }

  _getDropDownMenu(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomDateTimePicker(
            Constants.PICK_DATE,
            Strings.LABEL_DATE,
            _selectedDate == null
                ? Strings.LABEL_CHOOSE_DATE
                : Helper.transformDate(_selectedDate), (pickedDate) {
          setState(() {
            _selectedDate = pickedDate;
          });
        }),
        Padding(padding: EdgeInsets.only(bottom: 30)),
        CustomDateTimePicker(
            Constants.PICK_TIME,
            Strings.LABEL_TIME,
            _selectedTime == null
                ? Strings.LABEL_CHOOSE_TIME
                : Helper.isAndroid(context)
                    ? Helper.transformAndroidTime(_selectedTime)
                    : Helper.transformCupertinoTime(_selectedTime),
            (pickedTime) {
          setState(() {
            _selectedTime = pickedTime;
          });
        }),
      ],
    );
  }

  _getNextButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          color: Color(ColorPalette.BUTTON_COLOR),
          padding: EdgeInsets.all(15),
          child: Text(
            Strings.LABEL_NEXT,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () {
            _validate(context);
          },
        ),
      ),
    );
  }

  void _validate(BuildContext context) {
    if (_selectedDate == null) {
      Helper.showSnackbar(
          context, Strings.ERROR_SELECT_DATE, Strings.LABEL_OKAY);
    } else if (_selectedTime == null) {
      Helper.showSnackbar(
          context, Strings.ERROR_SELECT_TIME, Strings.LABEL_OKAY);
    } else {
      // navigate to next screen
      Navigator.pushNamed(context, Strings.ROUTE_THANK_YOU);
    }
  }
}
