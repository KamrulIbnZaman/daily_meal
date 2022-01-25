import 'package:flutter/material.dart';

import '../screens/category_item_screen.dart';

class CategoryList extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryList(this.id, this.title, this.color);

  void showCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryItemScreen.namedRout, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
