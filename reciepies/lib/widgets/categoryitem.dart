import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title, id;
  final Color color;
  CategoryItem(this.id, this.title, this.color);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      // MaterialPageRoute(
      //   builder: (_) {
      //     return CategoriesMealsScreen(id, title);
      //   },
      // ),
      CategoriesMealsScreen.routename,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
