import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/SourceResponce.dart';
import 'package:news_app/shared/netwok/api_manager.dart';

import '../models/category_model.dart';

import '../screens/home/category_tab.dart';
import '../screens/source/data.dart';
import '../screens/source/source_view_model.dart';
import 'appBar.dart';
import 'drawer.dart';
import 'editAppBar.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _messageSelected = true;
  CategoryModel? selectedCategory;

  void appBarChange() {
    setState(() {
      _messageSelected = !_messageSelected;
    });
  }

  void onCategoryClicked(CategoryModel category) {
    print("Category clicked: ${category.name}");
    setState(() {
      selectedCategory = category;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
          DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: _messageSelected ?  DrawerTab(
          onClick: onDrawerClick,
        ) : null,
        appBar: _messageSelected
            ? MainAppBar(context, appBarChange)
            : EditedAppBar(context, appBarChange),
        body: selectedCategory == null
            ? CategoryTab(onClick: onCategoryClicked)
            : DataTab(
          categoryId: selectedCategory!.id,
        ),
      ),
    );
  }
  onDrawerClick(id) {
    if (id == DrawerTab.CATEGORY_ID) {
      selectedCategory = null;
      Navigator.pop(context);
    } else if (id == DrawerTab.SETTINGS_ID) {}
    setState(() {});
  }
}

