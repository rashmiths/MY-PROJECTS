import 'package:flutter/material.dart';

import 'package:meals_app/screens/filterScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListView(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            color: Colors.amber,
            alignment: Alignment.centerLeft,
            child: Text(
              "CookingUp!",
              style: TextStyle(
                fontSize: 24,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                // fontFamily: 'RobotoCondensed'
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          buildListView('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListView('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routename);
          })
        ],
      ),
    );
  }
}
