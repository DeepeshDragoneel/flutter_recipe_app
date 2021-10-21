import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/widgets/categoryItemTile.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  // const FavoritesScreen({Key? key}) : super(key: key);
  final List<Meal> favoriteItems;
  FavoritesScreen(this.favoriteItems);

  @override
  Widget build(BuildContext context) {
    if (favoriteItems.isEmpty) {
      return Center(
        child: Text('You have no Favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, idx) {
          return CategoryItemTile(
            id: favoriteItems[idx].id,
            title: favoriteItems[idx].title,
            imageUrl: favoriteItems[idx].imageUrl,
            duration: favoriteItems[idx].duration,
            complexity: favoriteItems[idx].complexity,
            affordability: favoriteItems[idx].affordability,
            // removeRecipe: removeRecipe,
          );
        },
        itemCount: favoriteItems.length,
      );
    }
  }
}
