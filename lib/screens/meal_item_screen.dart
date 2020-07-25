import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItemScreen extends StatelessWidget {
  static const String route = '/meal-item';
  @override
  Widget build(BuildContext context) {
    Meal meal = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(meal.imageUrl, fit: BoxFit.fill,),
            ),
            buildSection('Ingredients', meal.ingredients),
            buildSection('Steps', meal.steps),
          ],
        ),
      ),
    );
  }

  Column buildSection(String sectionTitle, List<String> list) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Text(sectionTitle, style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 25),
        ),
        SizedBox(height: 5,),
        Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                    style: BorderStyle.solid,
                  )
                ),
                height: 150,
                padding: EdgeInsets.all(10),
                child: ListView.builder(itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(child: Text
                    (list[index], style: TextStyle(
                    color: Colors.white,
                  ),), padding:
                  EdgeInsets
                      .symmetric
                    (vertical: 10, horizontal: 10),),
                ),
                  itemCount: list.length,),
              ),
      ],
    );
  }
}
