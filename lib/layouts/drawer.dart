import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;

  DrawerTab({required this.onClick, super.key});

  static const int CATEGORY_ID = 1;
  static const int SETTINGS_ID = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(color: Colors.green),
            child: Center(child: Text("News ",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white))),
          ),
          InkWell(
            onTap: () {
              onClick(CATEGORY_ID);
            },
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              onClick(SETTINGS_ID);
            },
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}