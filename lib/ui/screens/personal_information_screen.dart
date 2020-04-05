import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';
import 'package:gin_finance/constants/constants.dart';
import 'package:gin_finance/constants/strings.dart';
import 'package:gin_finance/ui/custom_widgets/custom_drop_down_menu.dart';
import 'package:gin_finance/ui/custom_widgets/state_progress_bar.dart';
import 'package:gin_finance/utility/helper.dart';

class PersonalInformationScreen extends StatefulWidget {
  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  String _selectedGoal = '';
  String _selectedMonthlyIncome = '';
  String _selectedMonthlyExpense = '';

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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StateProgressBar(Constants.totalStateCount,
                      Constants.personalInformationPageState),
                  _getTitleText(),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  _getSubTitleText(),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  _getDropDownMenu(),
                  Padding(padding: EdgeInsets.only(bottom: 70)),
                  _getNextButton(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getTitleText() {
    return Text(Strings.PERSONAL_INFORMATION,
        style: Theme.of(context).textTheme.title);
  }

  _getSubTitleText() {
    return Text(Strings.PERSONAL_INFORMATION_SUBTITLE,
        style: Theme.of(context)
            .textTheme
            .subtitle
            .copyWith(color: Color(ColorPalette.WHITE_WITH_OPACITY)));
  }

  _getDropDownMenu() {
    return Column(
      children: <Widget>[
        CustomDropDownMenu(Strings.GOAL_FOR_ACTIVATION, Constants.GAOLS_LIST,
            (selectedValue) {
          _selectedGoal = selectedValue;
        }),
        Padding(padding: EdgeInsets.only(bottom: 30)),
        CustomDropDownMenu(
            Strings.MONTHLY_INCOME, Constants.MONTHLY_INCOME_EXPENSE,
            (selectedValue) {
          _selectedMonthlyIncome = selectedValue;
        }),
        Padding(padding: EdgeInsets.only(bottom: 30)),
        CustomDropDownMenu(
            Strings.MONTHLY_EXPENSE, Constants.MONTHLY_INCOME_EXPENSE,
            (selectedValue) {
          _selectedMonthlyExpense = selectedValue;
        })
      ],
    );
  }

  _getNextButton(BuildContext context) {
    return SizedBox(
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
    );
  }

  void _validate(BuildContext context) {
    if (_selectedGoal.isEmpty) {
      Helper.showToast(context, Strings.error_select_goal, Strings.LABEL_OKAY);
    } else if (_selectedMonthlyIncome.isEmpty) {
      Helper.showToast(context, Strings.error_select_monthly_income, Strings.LABEL_OKAY);
    } else if (_selectedMonthlyExpense.isEmpty) {
      Helper.showToast(context, Strings.error_select_monthly_expense, Strings.LABEL_OKAY);
    } else {
      // we can also have other validations like monthly expense should not be greater than monthly income
      // navigate to next screen
    }
  }
}
