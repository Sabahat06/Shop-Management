import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meals.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map< String, Object>> _page;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _page = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Your Favorites'}
  ];
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
          Text(_page[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _page[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        //currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}