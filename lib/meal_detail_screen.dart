import 'package:flutter/material.dart';
import './dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text("${text}", style: Theme.of(context).textTheme.headline6),
    );
  }

  static const routeName = "/meal-detail";
  final Function _toggleFav;
  final Function _isFav;

  MealDetailScreen(this._toggleFav, this._isFav);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text("${selectedMeal.title}")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle("Ingredients", context),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(15),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  color: Color.fromARGB(255, 109, 191, 229),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            ),
            buildSectionTitle("Steps", context),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: selectedMeal.steps.length,
                itemBuilder: (contex, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text("# ${index + 1}")),
                    title: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 0.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isFav(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          _toggleFav(mealId);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              content: _isFav(mealId)
                  ? Text("Added to favourites")
                  : Text("Removed from favourites"),
            ),
          );
        },
      ),
    );
  }
}
