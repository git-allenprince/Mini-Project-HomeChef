import 'package:flutter/material.dart';
import 'package:homechef_v3/blocs/basket/basket_bloc.dart';
import 'package:homechef_v3/config/app_router.dart';
import 'package:homechef_v3/config/theme.dart';
import 'package:homechef_v3/repository/geolocation/geolocation_repository.dart';
import 'package:homechef_v3/screens/splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
            create: (_) => GeolocationRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BasketBloc()..add(StartBasket()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HomeChef',
          theme: themes(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
