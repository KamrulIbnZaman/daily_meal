import 'package:flutter/material.dart';

import '../module/meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryItemScreen extends StatefulWidget {
  static const namedRout = '/category-item';
  final Function _addFavorite;

  final List<Meal> _mealList;
  CategoryItemScreen(this._addFavorite, this._mealList);

  @override
  _CategoryItemScreenState createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var _haveChanged = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_haveChanged) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryMeals = widget._mealList.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _haveChanged = true;
    }
    super.didChangeDependencies();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
