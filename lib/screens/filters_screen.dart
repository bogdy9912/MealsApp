import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.saveFilters,this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _veganFree = false;
  var _vegetarianFree = false;
  var _lactoseFree = false;

  @override
  initState(){
    super.initState();
   _glutenFree = widget.currentFilters['gluten'];
   _veganFree = widget.currentFilters['vegan'];
   _vegetarianFree = widget.currentFilters['vegetarian'];
   _lactoseFree = widget.currentFilters['lactose'];
  }

  Widget _buildSwitchListTile(
      String title, bool currentValue, Function update) {
    return SwitchListTile(
      title: Text(title, style: TextStyle(fontSize: 18 * MediaQuery.of(context).textScaleFactor),),
      value: currentValue,
      subtitle: Text('Include only ${title} meals', style: TextStyle(fontSize: 13 * MediaQuery.of(context).textScaleFactor),),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[          
          Row(
            children: <Widget>[
              Text('Save'),
              IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    final selectedFilters = {
                      'gluten': _glutenFree,
                      'vegan': _veganFree,
                      'vegetarian': _vegetarianFree,
                      'lactose': _lactoseFree
                    };

                    widget.saveFilters(selectedFilters);
                  }),
            ],
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-free', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile('Vegan', _veganFree, (newValue) {
                  setState(() {
                    _veganFree = newValue;
                  });
                }),
                _buildSwitchListTile('Vegetarian', _vegetarianFree, (newValue) {
                  setState(() {
                    _vegetarianFree = newValue;
                  });
                }),
                _buildSwitchListTile('Lactose', _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
