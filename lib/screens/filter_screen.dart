import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const String route = "/filters-screen";

  final Map<String, bool> filters;

  final Function saveFilters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isVegan = true;

  bool isVegetarian = true;

  bool isGlutenFree = true;

  bool isLactoseFree = true;

  @override
  initState(){
    isVegan = widget.filters['vegan'];
    isVegetarian = widget.filters['vegetarian'];
    isGlutenFree = widget.filters['gluten'];
    isLactoseFree = widget.filters['lactose'];
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String description, bool value, Function onChangeHandler) {

    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: onChangeHandler,
    );
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          FlatButton(child: Icon(Icons.save), onPressed: () => {
            widget.saveFilters({
              'gluten' : isGlutenFree,
              'lactose' : isLactoseFree,
              'vegan' : isVegan,
              'vegetarian' : isVegetarian
            })
          },)
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              "Adjust you meals here",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  "Vegan",
                  "show Vegan meals",
                  isVegan,
                  (newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  "Vegetarian",
                  "show Vegetarian meals",
                  isVegetarian,
                      (newValue) {
                    setState(() {
                      isVegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  "Gluten Free",
                  "show Gluten Free meals",
                  isGlutenFree,
                      (newValue) {
                    setState(() {
                      isGlutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  "Lactose Free",
                  "show Lactose Free meals",
                  isLactoseFree,
                      (newValue) {
                    setState(() {
                      isLactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
