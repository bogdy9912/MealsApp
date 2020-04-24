import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> _favoritesMeals;

  FavoritesScreen(this._favoritesMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget._favoritesMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites - start adding some!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20 * MediaQuery.of(context).textScaleFactor,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget._favoritesMeals[index].id,
            title: widget._favoritesMeals[index].title,
            imageUrl: widget._favoritesMeals[index].imageUrl,
            duration: widget._favoritesMeals[index].duration,
            complexity: widget._favoritesMeals[index].complexity,
            affordability: widget._favoritesMeals[index].affordability,
          );
        },
        itemCount: widget._favoritesMeals.length,
      );
    }
  }
}
