import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabscreen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = '/filterscreen';
  Function setFilters;
  Map filters;

  FilterScreen(this.setFilters,this.filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    isGlutenFree=widget.filters['gluten'];
    isLactoseFree=widget.filters['lactose'];
    isVegan=widget.filters['vegan'];
    isVegetarian=widget.filters['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian,
                };

                widget.setFilters(selectedFilters);
                Navigator.of(context).pushReplacementNamed('/');
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your Meals',
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              SwitchListTile(
                value: isGlutenFree,
                onChanged: (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                },
                title: Text('IsGlutenFree'),
                subtitle: Text('only include gluten free meals'),
              ),
              SwitchListTile(
                value: isLactoseFree,
                onChanged: (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                },
                title: Text('IsLactoseFree'),
                subtitle: Text('only include lactose free meals'),
              ),
              SwitchListTile(
                value: isVegan,
                onChanged: (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                },
                title: Text('IsVegan'),
                subtitle: Text('only include Vegan meals'),
              ),
              SwitchListTile(
                value: isVegetarian,
                onChanged: (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                },
                title: Text('IsVegetarian'),
                subtitle: Text('only include Vegetarian meals'),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
