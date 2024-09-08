import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layouts/splash.dart';
import 'package:news_app/screens/source/bloc_observer.dart';

import 'layouts/home.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context) => SplashScreen(),
        HomeScreen.routeName:(context) => HomeScreen(),
      },

    );
  }
}

