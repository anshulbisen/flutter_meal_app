import 'package:flutter/material.dart';
import '../screens/meal_item_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {

  final Meal meal;

  MealItem({this.meal});

  void selectMeal(BuildContext context){
    Navigator.pushNamed(context, MealItemScreen.route,arguments: this.meal);
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular
                    (15), topRight: Radius.circular(15)),
                  child: Image.network(this.meal.imageUrl, height: 250,
                    width: double.infinity, fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,

                  child: Container(
                    width: 300,
                    child: Text(this.meal.title, style: TextStyle(
                      color: Colors.white,

                      fontSize: 26,
                      backgroundColor: Colors.black54,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,)
                    ,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.access_time),
                    SizedBox(width: 10,),
                    Text('${this.meal.duration}'),
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 10,),
                    Text('${this.meal.complexity.toString().split(".").last}'),
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 10,),
                    Text('${this.meal.affordability.toString().split(".")
                        .last}'),
                  ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
