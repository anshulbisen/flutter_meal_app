import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const route = '/categories-meal';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as
    Map<String, Object>;

    final filteredMeals = availableMeals.where((element) => element.categories
        .contains(arguments['id'])).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title']),
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (ctx, index){
          return MealItem(meal: filteredMeals[index]);
        },itemCount:
        filteredMeals.length,),
      ),
    );
  }
}
