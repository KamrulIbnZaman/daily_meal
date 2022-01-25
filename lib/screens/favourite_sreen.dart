import 'package:flutter/material.dart';

import '../module/meal.dart';
import '../widgets/meal_item.dart';

class Favorite extends StatelessWidget {
  final List<Meal> _favoriteMeal;
  Favorite(this._favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (_favoriteMeal.isEmpty) {
      return Center(
        child: Text('No favorite has yet been added, go add some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoriteMeal[index].id,
            title: _favoriteMeal[index].title,
            imageUrl: _favoriteMeal[index].imageUrl,
            duration: _favoriteMeal[index].duration,
            affordability: _favoriteMeal[index].affordability,
            complexity: _favoriteMeal[index].complexity,
          );
        },
        itemCount: _favoriteMeal.length,
      );
    }
  }
}
