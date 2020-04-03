import 'package:flutter/material.dart';
import 'package:gin_finance/themes/basic_theme.dart';
import 'package:gin_finance/ui/screens/registration_screen.dart';
import 'package:gin_finance/ui/screens/welcome_screen.dart';
import 'constants/strings.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.APP_TITLE,
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      routes: <String, WidgetBuilder>{
        Strings.ROUTE_WELCOME: (BuildContext context) => WelcomeScreen(),
        Strings.ROUTE_REGISTRATION: (BuildContext context) => RegistrationScreen()
      },
    );
  }
}
