class Constants {
// total step count for state progress
  static const int totalStateCount = 4;

  // page step number for state progress
  static const int welcomePageState = 1;
  static const int registrationPageState = 2;

  // password complexity parameters
  static const String UPPERCASE = 'uppercase';
  static const String LOWERCASE = 'lowercase';
  static const String NUMBER = 'number';
  static const String CHARACTER = 'character';

  static const String LABEL_UPPERCASE = 'Uppercase';
  static const String LABEL_LOWERCASE = 'Lowercase';
  static const String LABEL_NUMBER = 'Number';
  static const String LABEL_CHARACTER = 'Character';
  static const String SYMBOL_UPPERCASE = 'A';
  static const String SYMBOL_LOWERCASE = 'a';
  static const String SYMBOL_NUMBER = '123';
  static const String SYMBOL_CHARACTER = '9+';

  static const List<String> PASSWORD_COMPLEXITY_LIST = [
    'Very Weak',
    'Weak',
    'Strong',
    'Very Strong'
  ];
}
