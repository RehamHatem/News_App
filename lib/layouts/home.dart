import 'package:flutter/material.dart';
import 'package:news_app/models/SourceResponce.dart';
import 'package:news_app/shared/netwok/api_manager.dart';

import '../models/category_model.dart';
import '../screens/category_tab.dart';
import '../screens/data.dart';
import '../screens/source_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          drawer: Drawer(),
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
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
          ),
          body: selectedCategory == null
              ? CategoryTab(onClick: onCategoryClicked)
              : DataTab(
            categoryId: selectedCategory!.id,
          ),
        ),
        Image.asset("assets/images/pattern.png", fit: BoxFit.fill),
      ],
    );
  }

  CategoryModel? selectedCategory;

  onCategoryClicked(category) {
    selectedCategory = category;
    setState(() {});
  }
}
