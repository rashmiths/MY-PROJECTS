import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../screens/FavouritesScreen.dart';
import '../screens/categories_meals_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
   List<Meal> favouritemeals;
  TabScreen(this.favouritemeals);
}

class _TabScreenState extends State<TabScreen> {
  int selectedPageIndex = 0;
  List<Map> pages;
 
  @override
  void initState() {
    // TODO: implement initState
     pages = [
    {
      'pages': CategoryScreen(),
      'title': 'Categories',
    },
    {
      'pages': FavouritesScreen(widget.favouritemeals),
      'title': 'Favourites',
    }
  ];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedPageIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favourites')),
        ],
      ),
    );
  }
}
