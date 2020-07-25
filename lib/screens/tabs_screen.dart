import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> widgets = [
      CategoriesScreen(),
      FavoritesScreen(),
  ];

  int _selectedIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
         backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("Categories"),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            title: Text("Favorites"),
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );

  }
}
