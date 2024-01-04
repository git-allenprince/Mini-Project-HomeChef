import 'package:flutter/material.dart';
import 'package:homechef_v3/screens/Login/adminlogin.dart';
import 'package:homechef_v3/screens/Login/customerlogin.dart';
import 'package:homechef_v3/screens/Login/homemakerlogin.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LoginScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: Container(
                  color: Colors.deepPurple,
                  child: TabBar(
                    isScrollable: true,
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cabin',
                      color: Colors.white,
                      fontWeight: FontWeight.bold// Set text color to white
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 30),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.bold// Set unselected text color to semi-transparent white
                    ),
                    indicatorPadding: EdgeInsets.all(0),
                    tabs: [
                      Tab(text: 'Customer'),
                      Tab(text: 'Homemaker'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CustomerLoginScreen(showCustomerRegisterScreen: () {  },),
                    HomemakerLoginScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

