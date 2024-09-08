import 'package:flutter/material.dart';

AppBar EditedAppBar(BuildContext context, Function changeAppBar) {
  var searchController = TextEditingController();
  return AppBar(
    backgroundColor: Colors.green,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        side: BorderSide(color: Colors.transparent)),
    iconTheme: IconThemeData(color: Colors.transparent),
    centerTitle: true,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
            filled: true,
            enabled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white, width: 2)),
            hintText: "Search Articles Here",
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            hintStyle: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: IconButton(
                onPressed: () {
                  changeAppBar();
                },
                icon: Icon(Icons.cancel),
                color: Colors.green,
                iconSize: 25),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.green,
              size: 25,
            )),
      ),
    ),
  );
}
