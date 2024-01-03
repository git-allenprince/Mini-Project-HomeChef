import 'package:flutter/material.dart';
import 'package:homechef_v3/screens/login/adminlogin.dart';
import 'package:homechef_v3/screens/login/customerlogin.dart';
import 'package:homechef_v3/screens/login/homemakerlogin.dart';

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
      // backgroundColor:
      //     Colors.deepPurple, // Set the background color to deep purple
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: kToolbarHeight, // Set the height for tab bar
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                // Set tab bar background color
                child: const TabBar(
                  indicatorColor: Colors.deepPurple,
                  // automaticIndicatorColorAdjustment: true,
                  tabAlignment: TabAlignment.center,
                  isScrollable: true,
                  labelStyle: TextStyle(fontSize: 13),
                  labelColor: Colors.deepPurple,
                  unselectedLabelColor: Colors.deepPurple,
                  indicatorPadding:
                      EdgeInsets.all(0), // Set the text color for selected tab
                  tabs: [
                    Tab(text: 'Customer'),
                    Tab(text: 'Homemaker'),
                    Tab(text: 'Admin')
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CustomerLoginScreen(),
                  HomemakerLoginScreen(),
                  AdminLoginScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
