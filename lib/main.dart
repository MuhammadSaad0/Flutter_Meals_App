import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'package:flutter_complete_guide/filters_screen.dart';
import './tabs_screen.dart';
import './meal_detail_screen.dart';
import './category_meals_screen.dart';
import './meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourte(String mealId) {
    final existingindex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingindex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingindex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
          canvasColor: Colors.white,
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                headline6: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      home: TabsScreen(_favouriteMeals),
      initialRoute: "/",
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavourte, _isMealFavourite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setFilters, _filters),
      },
    );
  }
}
