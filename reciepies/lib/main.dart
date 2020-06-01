import 'package:flutter/material.dart';
import 'package:meals_app/dummy_categories.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/filterScreen.dart';
import 'package:meals_app/screens/mealdetailscreen.dart';
import 'package:meals_app/screens/tabscreen.dart';
import './screens/category_screen.dart';
import './screens/categories_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Map<String,bool> filters={

    'gluten' : false,
    'lactose' : false,
    'vegan'   : false,
    'vegetarian' : false,



  };

  List<Meal> availableMeals=DUMMY_MEALS;
  List<Meal> favouriteMeals=[];


  void setFilters(Map<String,bool> filterData){

    setState(() {
      filters=filterData;
      availableMeals=DUMMY_MEALS.where((meal){

        if( filters['gluten'] && !meal.isGlutenFree) 
        {
          return false;
        }
         if( filters['lactose'] && !meal.isLactoseFree) 
        {
          return false;
        } 
        if( filters['vegan'] && !meal.isVegan) 
        {
          return false;
        } 
        if( filters['vegetarian'] && !meal.isVegetarian) 
        {
          return false;
        }

      return true;



      },).toList();
    });

    

   


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mealsapp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 51),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 51),
              ),
              title: TextStyle(
                fontSize:15,
                fontFamily:'RobotoCondensed',
                fontWeight: FontWeight.bold
              )
            ),
      ),
      initialRoute: '/',
      routes: {
        '/':(ctx)=>TabScreen(favouriteMeals),
        CategoriesMealsScreen.routename: (ctx)=> CategoriesMealsScreen(availableMeals),
        MealDetailScreen.routename: (ctx)=>MealDetailScreen(toggleFavourites,isFavourite),
        FilterScreen.routename:(ctx)=>FilterScreen(setFilters,filters),
      },
    );
    
  }
  void toggleFavourites(String mealId)
    {
      final existingIndex=favouriteMeals.indexWhere((meal)=>meal.id==mealId);

      if(existingIndex>=0)
      {
        setState(() {
          favouriteMeals.removeAt(existingIndex);

          
        });       
      
        
      }
      else
      {
        setState(() {
          favouriteMeals.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
        });
      }




    }     bool isFavourite(String mealId){

      return favouriteMeals.any((meal)=>meal.id==mealId);


    }

}

// class MyHomePage extends StatefulWidget {

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(

//         title: Text('DeliMeals'),
//       ),
//       body: Center(
//         child:Text("navigation"),
//       ),

//     );
//   }
// }
