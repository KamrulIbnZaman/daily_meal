import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './tabs_screen.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  final Function _setFilters;
  final Map<String, bool> _filters;

  FiltersScreen(
    this._filters,
    this._setFilters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluteenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegeterian = false;

  @override
  initState() {
    _gluteenFree = widget._filters['gluten'];
    _lactoseFree = widget._filters['lactose'];
    _vegeterian = widget._filters['vegetarian'];
    _vegan = widget._filters['vegan'];
    super.initState();
  }

  Widget _buildFilterSwitchList(
    String title,
    String subtitle,
    var condition,
    Function steFunction,
  ) {
    return SwitchListTile(
      value: condition,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: steFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            onPressed: () {
              widget._setFilters({
                'gluten': _gluteenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegeterian,
                'vegan': _vegan,
              });
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildFilterSwitchList(
                  'Gluten-Free', 'Only include gluten-free meals', _gluteenFree,
                  (valu) {
                setState(() {
                  _gluteenFree = valu;
                });
              }),
              _buildFilterSwitchList(
                  'Lactose_Free',
                  'Only include Lactose-free meals',
                  _lactoseFree, (steFunction) {
                setState(() {
                  _lactoseFree = steFunction;
                });
              }),
              _buildFilterSwitchList(
                  'Vegetarian', 'Only Include vagetarian meals', _vegeterian,
                  (steFunction) {
                setState(() {
                  _vegeterian = steFunction;
                });
              }),
              _buildFilterSwitchList(
                  'Vegan', 'Only include vegan meals', _vegan, (steFunction) {
                setState(() {
                  _vegan = steFunction;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
