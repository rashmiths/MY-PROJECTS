import 'package:flutter/material.dart';
import 'package:meals_app/screens/mealdetailscreen.dart';
import '../model/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability});

  void SelectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routename,
      arguments: {'id':id,'title':title}
    );
  }

  String get ComplexityText {
    if (complexity == Complexity.Simple) return 'simple';
    if (complexity == Complexity.Challenging) return 'challenging';
    if (complexity == Complexity.Hard) return 'hard';
  }

  String get AffordabilityText {
    if (affordability == Affordability.Affordable) return 'Affordable';
    if (affordability == Affordability.Luxurious) return 'Luxurious';
    if (affordability == Affordability.Pricey) return 'Pricey';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 5,
                    child: Container(
                        color: Colors.black54,
                        width: 250,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration mins'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text('$ComplexityText'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text('$AffordabilityText'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
