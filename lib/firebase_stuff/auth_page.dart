import 'package:flutter/material.dart';
import 'package:homechef_v3/screens/Login/customerlogin.dart';
import 'package:homechef_v3/screens/register/customer_register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  static const String routeName = '/authpage';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => AuthPage(),
      settings: RouteSettings(name: routeName),
    );
  }
  @override
  State<AuthPage> createState() => _AuthPageState();
}


class _AuthPageState extends State<AuthPage> {

  bool showCustomerLoginScreen=true;

  void toggleScreens(){
    setState(() {
      showCustomerLoginScreen=!showCustomerLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showCustomerLoginScreen){
      return CustomerLoginScreen(showCustomerRegisterScreen: toggleScreens);
    }
    else{
      return CustomerRegisterScreen(showCustomerLoginScreen: toggleScreens);
    }
  }
}
