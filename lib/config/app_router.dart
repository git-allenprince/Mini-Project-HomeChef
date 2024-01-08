// ignore_for_file: unreachable_switch_case, unnecessary_import

import 'package:flutter/material.dart';

import 'package:homechef_v3/screens/Login/forgot_pw_page.dart';

import 'package:homechef_v3/screens/basket/basket_screen.dart';

import 'package:homechef_v3/screens/checkout/checkout_screen.dart';
import 'package:homechef_v3/screens/delivery_time/delivery_time_screen.dart';
import 'package:homechef_v3/screens/edit_basket/edit_basket_screen.dart';
import 'package:homechef_v3/screens/home/home_screen.dart';

import 'package:homechef_v3/screens/location/location.dart';
import 'package:homechef_v3/screens/payment/payment_screen.dart';
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
      // case LoginScreen.routeName:
      //   return LoginScreen.route();
      // case CustomerLoginScreen.routeName:
      //   return CustomerLoginScreen.route();
      case CustomerRegisterScreen.routeName:
        return CustomerRegisterScreen.route();
      case HomemakerRegisterScreen.routeName:
        return HomemakerRegisterScreen.route();
      // case HomemakerLoginScreen.routeName:
      //   return HomemakerLoginScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      // case HomemakerDetailsScreen.routeName:
      //   return HomemakerDetailsScreen.route(arguments: {});
      // case HomemakerListingScreen.routeName:
      //   return HomemakerListingScreen.route(selectedItem: selectedItem);
      case LocationScreen.routeName:
        return LocationScreen.route();

      // case PlateScreen.routeName:
      //   return PlateScreen.route();
      // case MainPage.routeName:
      //   return MainPage.route();
      // case AuthPage.routeName:
      //   return AuthPage.route();
      case ForgotPasswordPage.routeName:
        return ForgotPasswordPage.route();
      // case ProfileScreen.routeName:
      //   return ProfileScreen.route();

      case PaymentScreen.routeName:
        return PaymentScreen.route();

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
