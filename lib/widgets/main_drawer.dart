import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: EdgeInsets.only(bottom: 15, left: 10),
            child: Text("The Meal App", style: TextStyle(
              color: Colors.white,
            fontSize: 30),
            ),
          ),
          alignment: Alignment.bottomLeft,
        ),
        buildListTile('Categories', Icons.restaurant,(){
          Navigator.of(context).pushNamed('/');

        }),
        buildListTile('Settings', Icons.settings, (){
          Navigator.of(context).pushNamed(FiltersScreen.route);
        }),
      ],
    );
  }
}
