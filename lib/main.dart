import 'package:flutter/material.dart';
import './meal_detail_screen.dart';
import './category_meals_screen.dart';
import './categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
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
      home: CategoriesScreen(),
      routes: {
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
    );
  }
}
