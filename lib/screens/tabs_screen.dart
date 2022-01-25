import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourite_sreen.dart';
import '../widgets/main_drawer.dart';
import '../module/meal.dart';

class TabsScreean extends StatefulWidget {
  static const routeName = '/tab-screen';
  final List<Meal> _favoriteMeal;
  TabsScreean(this._favoriteMeal);

  @override
  _TabsScreeanState createState() => _TabsScreeanState();
}

class _TabsScreeanState extends State<TabsScreean> {
  int _itemIndex = 0;
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': Categoriescreen(),
        'title': 'Category',
      },
      {'page': Favorite(widget._favoriteMeal), 'title': 'Favorites'},
    ];

    super.initState();
  }

  void selectScreen(int index) {
    setState(() {
      _itemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_itemIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_itemIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _itemIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('category'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorite'),
            )
          ]),
    );
  }
}
