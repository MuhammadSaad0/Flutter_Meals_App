import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/favourites_screen.dart';
import 'package:flutter_complete_guide/main_drawer.dart';
import './meal.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;
  TabsScreen(this._favouriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selected_index = 0;
  void _changetitle(int index) {
    setState(() {
      selected_index = index;
    });
  }

  final List<String> titles = [
    "Categories",
    "Favourites",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(titles[selected_index]),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavouritesScreen(widget._favouriteMeals),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star_border_purple500),
                text: "Favourites",
              ),
            ],
            indicatorColor: Colors.white,
            indicatorWeight: 2,
            unselectedLabelColor: Colors.black,
            onTap: _changetitle,
          ),
        ),
      ),
      length: 2,
    );
  }
}
