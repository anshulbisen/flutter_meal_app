import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const String title = "Categories";

  static const String route = "/categories-screen";
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3/2,
        ),
        children: DUMMY_CATEGORIES.map((category) =>
           CategoryItem(id: category.id,title: category.title, color:
          category.color,)
        ).toList(),
    );
  }
}
