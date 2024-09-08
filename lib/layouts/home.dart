import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/SourceResponce.dart';
import 'package:news_app/shared/netwok/api_manager.dart';

import '../models/category_model.dart';

import '../screens/home/category_tab.dart';
import '../screens/source/data.dart';
import '../screens/source/source_view_model.dart';
import 'appBar.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _messageSelected ? Drawer() : null,
      appBar: _messageSelected
          ? MainAppBar(context, appBarChange)
          : EditedAppBar(context, appBarChange),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/pattern.png",
              fit: BoxFit.fill,
            ),
          ),
          selectedCategory == null
              ? CategoryTab(onClick: onCategoryClicked)
              : BlocProvider(
            create: (context) => SourceViewModel(),
            child: DataTab(
              categoryId: selectedCategory!.id,
            ),
          ),
        ],
      ),
    );
  }
}

