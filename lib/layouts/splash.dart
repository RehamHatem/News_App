import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState(
    );
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(child: Image.asset("assets/images/logo.png")),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("supervised by Mohamed Hamouda",style: TextStyle(
                  color: Color(0xff39A552),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
              )
            ],
          ),

        ),
        Image.asset("assets/images/pattern.png",fit: BoxFit.fill),

      ],
    );
  }
}
