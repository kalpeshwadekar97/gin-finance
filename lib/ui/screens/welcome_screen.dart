import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';
import 'package:gin_finance/constants/constants.dart';
import 'package:gin_finance/constants/strings.dart';
import 'package:gin_finance/ui/custom_widgets/custom_text_form_field.dart';
import 'package:gin_finance/ui/custom_widgets/state_progress_bar.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Container(
        color: Color(ColorPalette.BACKGROUND_WHITE),
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StateProgressBar(
                Constants.totalStateCount, Constants.welcomePageState),
            _getWelcomeText(),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            _getWelcomeSubTitle(),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            _getEmailTextFormField(),
            Padding(padding: EdgeInsets.only(bottom: 40.0)),
            _getNextButton()
          ],
        ),
      ),
    );
  }

  _validate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  _validateEmail(email) {
    var emailRegex = '^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}';
    return RegExp(emailRegex).hasMatch(email);
  }

  _getWelcomeText() {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: Strings.WELCOME_TEXT,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.black)),
        TextSpan(
          text: Strings.WELCOME_FINANS_TEXT,
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(color: Theme.of(context).primaryColor),
        ),
      ]),
    );
  }

  _getWelcomeSubTitle() {
    return Text(Strings.WELCOME_SUBTITLE,
        style:
            Theme.of(context).textTheme.subhead.copyWith(color: Colors.black));
  }

  _getEmailTextFormField() {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: GinFinanceTextFormField(
              Strings.HINT_ENTER_EMAIL,
              Icon(Icons.email, color: Colors.grey),
              TextInputType.emailAddress,
              (email) => _validateEmail(email)),
        ),
      ),
    );
  }

  _getNextButton() {
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
          _validate();
          Navigator.pushNamed(context, Strings.ROUTE_REGISTRATION);
        },
      ),
    );
  }
}
