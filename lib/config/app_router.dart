// ignore_for_file: unreachable_switch_case, unnecessary_import

import 'package:flutter/material.dart';
import 'package:homechef_v3/firebase_stuff/auth_page.dart';
import 'package:homechef_v3/firebase_stuff/main_page.dart';
import 'package:homechef_v3/screens/Login/customerlogin.dart';
import 'package:homechef_v3/screens/Login/forgot_pw_page.dart';
import 'package:homechef_v3/screens/Login/homemakerlogin.dart';
import 'package:homechef_v3/screens/Login/loginpagecombined.dart';
import 'package:homechef_v3/models/homemaker_model.dart';
import 'package:homechef_v3/screens/Profile/profileScreen.dart';
import 'package:homechef_v3/screens/checkout/checkout_screen.dart';
import 'package:homechef_v3/screens/delivery_time/delivery_time_screen.dart';
import 'package:homechef_v3/screens/edit_plate/edit_plate_screen.dart';
import 'package:homechef_v3/screens/filter/filter_screen.dart';
import 'package:homechef_v3/screens/home/home_screen.dart';
import 'package:homechef_v3/screens/homemaker_details/homemaker_details_screen.dart';
import 'package:homechef_v3/screens/homemaker_listing/homemaker_listing_screen.dart';
import 'package:homechef_v3/screens/location/location.dart';
import 'package:homechef_v3/screens/plate/plate_screen.dart';
import 'package:homechef_v3/screens/register/customer_register.dart';
import 'package:homechef_v3/screens/register/homemaker_register.dart';
import 'package:homechef_v3/screens/screens.dart';
import 'package:homechef_v3/screens/splash/splash.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The route is : ${settings.name}');

    switch (settings.name) {
      case '/homescreen':
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case CustomerLoginScreen.routeName:
        return CustomerLoginScreen.route();
      case CustomerRegisterScreen.routeName:
        return CustomerRegisterScreen.route();
      case HomemakerRegisterScreen.routeName:
        return HomemakerRegisterScreen.route();
      case HomemakerLoginScreen.routeName:
        return HomemakerLoginScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case EditPlateScreen.routeName:
        return EditPlateScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case HomemakerDetailsScreen.routeName:
        return HomemakerDetailsScreen.route(
            homemaker: settings.arguments as Homemaker);
      case HomemakerListingScreen.routeName:
        return HomemakerListingScreen.route(
            homemakers: settings.arguments as List<Homemaker>);
      case LocationScreen.routeName:
        return LocationScreen.route();
      case PlateScreen.routeName:
        return PlateScreen.route();
      case MainPage.routeName:
        return MainPage.route();
      case AuthPage.routeName:
        return AuthPage.route();
      case ForgotPasswordPage.routeName:
        return ForgotPasswordPage.route();
      // case ProfileScreen.routeName:
      //   return ProfileScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
