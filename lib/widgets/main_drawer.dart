import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title,IconData icon, Function tabHandler){
    return ListTile(
            leading: Icon(
              icon,
              size: 26,
            ),
            title: Text(
              title, 
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: tabHandler,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text('Cooking Up!', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),),
          ),
          SizedBox(height: 20,),
          buildListTile(
            'Meal', 
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');            
            }
            ),
          buildListTile(
            'Filter', 
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
            }
            ),
        ],),
    );
  }
}