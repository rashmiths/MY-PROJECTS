import 'package:flutter/material.dart';
import 'package:meals_app/dummy_categories.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/mealitem.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routename = '/categoriesmeals';

  final List<Meal> availableMeals;

  CategoriesMealsScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    // final String id,title;
    // CategoriesMealsScreen(this.id,this.title);
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoriesMeals = availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctxt, index) {
            return MealItem(
              id: categoriesMeals[index].id,
              title: categoriesMeals[index].title,
              imageUrl: categoriesMeals[index].imageUrl,
              duration: categoriesMeals[index].duration,
              complexity: categoriesMeals[index].complexity,
              affordability: categoriesMeals[index].affordability,
            );
          },
          itemCount: categoriesMeals.length,
        ));
  }
}
