import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/mealitem.dart';
class FavouritesScreen extends StatelessWidget {
  List<Meal> favouritemeals;
  FavouritesScreen(this.favouritemeals);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemBuilder: (ctxt, index) {
            return MealItem(
              id: favouritemeals[index].id,
              title: favouritemeals[index].title,
              imageUrl: favouritemeals[index].imageUrl,
              duration: favouritemeals[index].duration,
              complexity: favouritemeals[index].complexity,
              affordability: favouritemeals[index].affordability,
            );
          },
          itemCount: favouritemeals.length,
        );
    
  }
}