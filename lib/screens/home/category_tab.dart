import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../source/data.dart';
import 'category_item.dart';

class CategoryTab extends StatelessWidget {
  final Function(CategoryModel) onClick;

  CategoryTab({super.key, required this.onClick});

  List<CategoryModel> allCategories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Pick your category of interest",
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onClick(allCategories[index]);
                    print("Category tapped: ${allCategories[index].name}");

                  },
                  child: CategoryItem(
                    model: allCategories[index],
                    index: index,
                  ),
                );
              },
              itemCount: allCategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
            ),
          )
        ],
      ),
    );
  }
}