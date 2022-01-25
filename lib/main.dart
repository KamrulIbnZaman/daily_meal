import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/screens/item_detail_screen.dart';

import './screens/categories_screen.dart';
import './screens/category_item_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './module/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void sectFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if (filterData['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filterData['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filterData['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filterData['vegan'] && !meal.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _addFavorite(String mealId) {
    var isFull = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (isFull >= 0) {
      setState(() {
        _favoriteMeal.removeAt(isFull);
      });
    } else {
      setState(() {
        _favoriteMeal.add(
          DUMMY_MEALS.firstWhere(((meal) => meal.id == mealId)),
        );
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeilyMeals',
      theme: ThemeData(
          primaryColor: Colors.redAccent,
          primarySwatch: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromARGB(20, 51, 51, 1),
                ),
                title: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
      // home: TabsScreean(_favoriteMeal),
      routes: {
        '/': (_) => TabsScreean(_favoriteMeal),
        CategoryItemScreen.namedRout: (_) =>
            CategoryItemScreen(_addFavorite, _availableMeal),
        ItemDetailScreen.namedRout: (_) =>
            ItemDetailScreen(_isFavorite, _addFavorite),
        FiltersScreen.routeName: (_) => FiltersScreen(filters, sectFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => Categoriescreen());
      },
    );
  }
}
