import "package:flutter/material.dart";
import './meal_item.dart';
import './meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs["title"];
    final categoryID = routeArgs["id"];
    displayedMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          categoryTitle,
        )),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
