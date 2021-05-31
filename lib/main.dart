import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tab_screen.dart';
import './screens/filter_screen.dart';
import './dummy_data.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  }; 

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];
  
  void _setFilter(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final existingIndex =_favoriteMeal.indexWhere((meal) => meal.id==mealId);
    if(existingIndex >=0){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    }
    else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeal.any((meal) => meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RoboCondensed',
          ),
        ),
      ),
      initialRoute: '/', //Set by Default
      routes: {
        '/': (ctx) => TabScreen(_favoriteMeal), 
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,_setFilter),
      },
    );
  }
}

