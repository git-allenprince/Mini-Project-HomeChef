import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homechef_v3/blocs/basket/basket_bloc.dart';
import 'package:homechef_v3/blocs/homemaker/homemaker_bloc.dart';
import 'package:homechef_v3/config/app_router.dart';
import 'package:homechef_v3/config/theme.dart';

import 'package:homechef_v3/firebase_stuff/main_page.dart';
import 'package:homechef_v3/repository/homemaker/homemaker_repository.dart';
import 'package:homechef_v3/screens/Login/homemakerlogin.dart';
import 'package:homechef_v3/screens/home/home_screen.dart';
import 'package:homechef_v3/screens/splash/splash.dart';
import 'firebase_options.dart';

import 'package:homechef_v3/repository/geolocation/geolocation_repository.dart';
import 'package:homechef_v3/screens/splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
// <<<<<<< allen_new_final
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'HomeChef',
//       theme: themes(),
//       onGenerateRoute: AppRouter.onGenerateRoute,
//       initialRoute: SplashScreen.routeName,
// =======
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
            create: (_) => GeolocationRepository()),
        RepositoryProvider<HomemakerRepository>(
            create: (_) => HomemakerRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomemakerBloc(
              homemakerRepository: context.read<HomemakerRepository>(),
            ),
          ),
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
