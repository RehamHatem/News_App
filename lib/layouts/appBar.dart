import 'package:flutter/material.dart';



AppBar MainAppBar(BuildContext context,Function changeAppBar) {
    return  AppBar(
    backgroundColor: Colors.green,
    elevation: 0,
    actions: [
    IconButton(onPressed: () {
        changeAppBar();
    },icon: Icon(Icons.search),style: ButtonStyle(
    iconSize: MaterialStatePropertyAll(30),
    padding: MaterialStatePropertyAll(EdgeInsets.all(8))
    ),)
    ],
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    bottomRight: Radius.circular(25)),side: BorderSide(color: Colors.transparent)),
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    title: Text("News",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.white)),
    );
  }

