import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/categories_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_item_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten' : true,
    'lactose' : true,
    'vegan' : true,
    'vegetarian' : true
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _saveFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      _availableMeals= DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && meal.isGlutenFree)
          return true;
        if(_filters['lactose'] && meal.isLactoseFree)
          return true;
        if(_filters['vegan'] && meal.isVegan)
          return true;
        if(_filters['vegetarian'] && meal.isVegetarian)
          return true;
        else return false;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Z Meals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsScreen(),
      routes: {
        CategoriesScreen.route : (ctx) => CategoriesScreen(),
        CategoryMealsScreen.route : (ctx) => CategoryMealsScreen(_availableMeals),
        MealItemScreen.route : (ctx) => MealItemScreen(),
        FiltersScreen.route : (ctx) => FiltersScreen(_filters, _saveFilters)
      },
    );
  }
}
