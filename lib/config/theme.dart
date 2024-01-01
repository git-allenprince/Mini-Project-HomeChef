import 'package:homechef_v3/screens/screens.dart';

ThemeData theme() {
  return ThemeData(
      primaryColor: Color(0xFF673AB7),
      primaryColorDark: Color(0x4F1AAC),
      primaryColorLight: Color(0xA384DD),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.grey[400],
      fontFamily: 'Futura',
      textTheme: TextTheme(
          headlineLarge: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.normal,
      )));
}
