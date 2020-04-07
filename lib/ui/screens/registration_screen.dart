import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';
import 'package:gin_finance/constants/constants.dart';
import 'package:gin_finance/constants/strings.dart';
import 'package:gin_finance/ui/custom_widgets/custom_icon_done.dart';
import 'package:gin_finance/ui/custom_widgets/state_progress_bar.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _password = '';

  // Initially password is obscure
  bool _obscureText = true;

  // Password complexity states
  HashMap<String, bool> _passwordComplexityStates = HashMap.of({
    Constants.UPPERCASE: false,
    Constants.LOWERCASE: false,
    Constants.NUMBER: false,
    Constants.CHARACTER: false
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.CREATE_ACCOUNT),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
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
                          Constants.registrationPageState),
                    ),
                    _getTitleText(),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    _getSubTitleText(),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    _getPasswordTextFormField(),
                    Padding(padding: EdgeInsets.only(bottom: 40)),
                    _getPasswordComplexityStatus(),
                    Padding(padding: EdgeInsets.only(bottom: 50)),
                    _getPasswordComplexityLayout(),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _getNextButton(),
            )
          ],
        ),
      ),
    );
  }

  // Toggles the password show status
  void _togglePasswordObscureState() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _getTitleText() {
    return Text(Strings.CREATE_PASSWORD,
        style: Theme.of(context).textTheme.title);
  }

  _getSubTitleText() {
    return Text(Strings.CREATE_PASSWORD_SUBTITLE,
        style: Theme.of(context)
            .textTheme
            .subtitle
            .copyWith(color: Color(ColorPalette.WHITE_WITH_OPACITY)));
  }

  _getPasswordTextFormField() {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: TextFormField(
        obscureText: _obscureText,
        style: Theme.of(context).textTheme.title.copyWith(color: Colors.black),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
              icon: _obscureText
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onPressed: () {
                _togglePasswordObscureState();
              },
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
              borderSide: const BorderSide(
                  color: Color(ColorPalette.PRIMARY_COLOR), width: 0.0),
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            hintText: Strings.HINT_CREATE_PASSWORD,
            hintStyle: Theme.of(context).textTheme.body1),
        validator: (String value) {
          return _validatePassword(value);
        },
        onChanged: (text) {
          _checkPasswordComplexity(text);
          setState(() {
            _password = text;
          });
        },
      ),
    );
  }

  _validate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      return false;
    }
  }

  _validatePassword(password) {
    var passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{10,}$';
    if (!RegExp(passwordRegex).hasMatch(password)) {
      return "Please provide valid password";
    }
  }

  _getPasswordComplexityStatus() {
    int _count = -1;
    _passwordComplexityStates.values.forEach((value) {
      if (value) ++_count;
    });
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: Strings.COMPLEXITY,
            style: Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(color: Color(ColorPalette.WHITE_WITH_OPACITY))),
        _password.length > 0
            ? TextSpan(
                text: Constants.PASSWORD_COMPLEXITY_LIST[_count],
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: Color(ColorPalette.WHITE_WITH_OPACITY)))
            : TextSpan(
                text: Strings.ENTER_PASSWORD,
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: Color(ColorPalette.WHITE_WITH_OPACITY)),
              ),
      ]),
    );
  }

  _getPasswordComplexityLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _getPasswordComplexityParameterLayout(
            Constants.SYMBOL_LOWERCASE,
            Constants.LABEL_LOWERCASE,
            _passwordComplexityStates[Constants.LOWERCASE]),
        Padding(padding: EdgeInsets.only(right: 10.0)),
        _getPasswordComplexityParameterLayout(
            Constants.SYMBOL_UPPERCASE,
            Constants.LABEL_UPPERCASE,
            _passwordComplexityStates[Constants.UPPERCASE]),
        Padding(padding: EdgeInsets.only(right: 10.0)),
        _getPasswordComplexityParameterLayout(
            Constants.SYMBOL_NUMBER,
            Constants.LABEL_NUMBER,
            _passwordComplexityStates[Constants.NUMBER]),
        Padding(padding: EdgeInsets.only(right: 10.0)),
        _getPasswordComplexityParameterLayout(
            Constants.SYMBOL_CHARACTER,
            Constants.LABEL_CHARACTER,
            _passwordComplexityStates[Constants.CHARACTER]),
      ],
    );
  }

  _getPasswordComplexityParameterLayout(
      String title, String subtitle, bool isConditionSatisfied) {
    return Column(
      children: <Widget>[
        isConditionSatisfied
            ? CustomIconDone()
            : Text(
                title,
                style: Theme.of(context).textTheme.subhead.copyWith(
                    color: Color(ColorPalette.WHITE_WITH_OPACITY),
                    fontWeight: FontWeight.w500, fontSize: 29.0),
              ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.subtitle.copyWith(
              color: Color(ColorPalette.WHITE_WITH_OPACITY), fontSize: 14),
        )
      ],
    );
  }

  _checkPasswordComplexity(String text) {
    _passwordComplexityStates[Constants.UPPERCASE] =
        text.contains(RegExp(r'[A-Z]'));
    _passwordComplexityStates[Constants.LOWERCASE] =
        text.contains(RegExp(r'[a-z]'));
    _passwordComplexityStates[Constants.NUMBER] =
        text.contains(RegExp(r'[0-9]'));
    _passwordComplexityStates[Constants.CHARACTER] = text.length > 9;
  }

  _getNextButton() {
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
            if (_validate())
              Navigator.pushNamed(context, Strings.ROUTE_PERSONAL_INFORMATION);
          },
        ),
      ),
    );
  }
}
