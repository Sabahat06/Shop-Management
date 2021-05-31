import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart'; 

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meal';
  final List<Meal> availableMeal;

  CategoryMealScreen(this.availableMeal);
  @override

  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen>{
  String categoryTitle;
  List<Meal> displayMeals;
  bool _loadedInitdata = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_loadedInitdata == false){
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitdata = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          id: displayMeals[index].id,
          title: displayMeals[index].title,
          imageUrl: displayMeals[index].imageUrl,
          duration: displayMeals[index].duration,
          affordability: displayMeals[index].affordability,
          complexity: displayMeals[index].complexity,
        );
      }, itemCount: displayMeals.length,),
    );
  }
}