import 'package:flutter/material.dart';
import 'package:news_app/layouts/splash.dart';

import 'layouts/home.dart';

void main() {
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

