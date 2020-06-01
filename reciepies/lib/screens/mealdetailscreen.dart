import 'package:flutter/material.dart';
import '../dummy_categories.dart';

class MealDetailScreen extends StatelessWidget {
  static const routename = '\meal-data';
  Function isFavourite;
  Function toggleFavourites;
  MealDetailScreen(this.toggleFavourites,this.isFavourite);

  Widget titleDecorator(context, title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final RouteArgs = ModalRoute.of(context).settings.arguments as Map;
    final String id = RouteArgs['id'];
    final String title = RouteArgs['title'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == id;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:  SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              child: Image.network(selectedMeal.imageUrl),
            ),
            titleDecorator(context, 'Ingredients'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(10),
                // boxShadow: BoxShadow({color:Co})
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctxt, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          selectedMeal.ingredients[index],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            SizedBox(height: 50,),
            titleDecorator(context, 'Steps'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(10),
                // boxShadow: BoxShadow({color:Co})
              ),
               margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(10),
              height: 300,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctxt, index) {
                  return  Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        toggleFavourites(id);
      },
      child: isFavourite(id)?Icon(Icons.star):Icon(Icons.star_border),),
    );
  }
}
