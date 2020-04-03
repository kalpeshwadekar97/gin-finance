import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';
import 'package:gin_finance/constants/strings.dart';
import 'package:gin_finance/ui/custom_widgets/custom_text_form_field.dart';

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
      child: SingleChildScrollView(
        child: Container(
          color: Color(ColorPalette.BACKGROUND_WHITE),
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
          child: Column(
            children: <Widget>[
              _getWelcomeText(),
              _getWelcomeSubTitle(),
              _getEmailTextFormField(),
              _getNextButton()
            ],
          ),
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
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: RichText(
          text: TextSpan(
              style: Theme.of(context).textTheme.display1.copyWith(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w700),
              children: <TextSpan>[
                TextSpan(text: Strings.WELCOME_TEXT),
                TextSpan(
                  text: Strings.WELCOME_FINANS_TEXT,
                  style: Theme.of(context).textTheme.headline.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
              ]),
        ),
      ),
    );
  }

  _getWelcomeSubTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(Strings.WELCOME_SUBTITLE,
          style: Theme.of(context)
              .textTheme
              .subhead
              .copyWith(color: Colors.black, fontSize: 20)),
    );
  }

  _getEmailTextFormField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Container(
              color: Color(ColorPalette.BACKGROUND_WHITE),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: GinFinanceTextFormField(
                  Strings.LABEL_EMAIL,
                  Strings.HINT_ENTER_EMAIL,
                  Icon(Icons.email),
                  TextInputType.emailAddress,
                  (email) => _validateEmail(email)),
            ),
          ),
        ),
      ),
    );
  }

  _getNextButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          padding: EdgeInsets.all(15),
          child: Text(
            Strings.LABEL_NEXT,
            style: Theme.of(context).textTheme.button.copyWith(fontSize: 18),
          ),
          onPressed: () {
            _validate();
            Navigator.pushNamed(context, Strings.ROUTE_REGISTRATION);
          },
        ),
      ),
    );
  }
}
