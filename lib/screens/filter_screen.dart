import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilter;
  final Map<String, bool> currentFilter;
  static const routeName = '/filter';
  
  FilterScreen(this.currentFilter ,this.saveFilter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  
  @override
  initState(){
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue){
    return SwitchListTile(
                  title: Text(title), 
                  value: currentValue,
                  subtitle: Text(description),
                  onChanged: updateValue,
              );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(selectedFilters);
            }
          ),
        ],
        ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your Meal Selection', style: Theme.of(context).textTheme.title,),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-Free', 
                  'Only Include Gluten-Free Meals', 
                  _glutenFree,
                  (newValue) {
                    setState((){
                      _glutenFree = newValue;
                    });
                  }
                  ),
                  _buildSwitchListTile(
                  'Lactose-Free', 
                  'Only Include Lactose-Free Meals', 
                  _lactoseFree,
                  (newValue) {
                    setState((){
                      _lactoseFree = newValue;
                    });
                  }
                  ),
                  _buildSwitchListTile(
                  'Vegetarian', 
                  'Only Include Vegetarian Meals', 
                  _vegetarian,
                  (newValue) {
                    setState((){
                      _vegetarian = newValue;
                    });
                  }
                  ),
                  _buildSwitchListTile(
                  'Vegan', 
                  'Only Include Vegan Meals', 
                  _vegan,
                  (newValue) {
                    setState((){
                      _vegan = newValue;
                    });
                  }
                  ),                  
            ],
          )),
        ]),
      )
    );
  }
}