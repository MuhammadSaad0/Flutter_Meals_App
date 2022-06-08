import "package:flutter/material.dart";
import './meal_detail_screen.dart';
import './meal.dart';
import 'package:flutter/foundation.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem(
      {@required this.title,
      @required this.id,
      @required this.imageUrl,
      @required this.complexity,
      @required this.affordability,
      @required this.duration,
      @required this.removeItem});

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      splashColor: Color.fromARGB(255, 196, 211, 247),
      splashFactory: InkRipple.splashFactory,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 23, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(duration.toString() + " mins"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(describeEnum(complexity)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money_sharp),
                        SizedBox(
                          width: 3,
                        ),
                        Text(describeEnum(affordability)),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
