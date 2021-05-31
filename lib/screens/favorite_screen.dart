import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  FavoriteScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return Center(
      child: Text('You Have No Favorites Yet - Add Some'),
    );
    }else{
      return ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          id: favoriteMeal[index].id,
          title: favoriteMeal[index].title,
          imageUrl: favoriteMeal[index].imageUrl,
          duration: favoriteMeal[index].duration,
          affordability: favoriteMeal[index].affordability,
          complexity: favoriteMeal[index].complexity,
        );
      }, itemCount: favoriteMeal.length,);
    }
  }
}