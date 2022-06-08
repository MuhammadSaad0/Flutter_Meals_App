import 'package:flutter/material.dart';
import './meal.dart';
import './meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;
  FavouritesScreen(this._favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favouriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favourites yet!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favouriteMeals[index].id,
            title: _favouriteMeals[index].title,
            imageUrl: _favouriteMeals[index].imageUrl,
            duration: _favouriteMeals[index].duration,
            affordability: _favouriteMeals[index].affordability,
            complexity: _favouriteMeals[index].complexity,
          );
        },
        itemCount: _favouriteMeals.length,
      );
    }
  }
}
