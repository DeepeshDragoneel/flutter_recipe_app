import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data.dart';
import 'package:flutter_recipe_app/widgets/categoryItemTile.dart';

class CategoryAvailiableItems extends StatelessWidget {
  // const CategoryAvailiableItems({ Key? key }) : super(key: key);

  // CategoryAvailiableItems(this.CatagoryId, this.Categorytitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String catagoryId = routeArgs["id"]!;
    final String categorytitle = routeArgs["title"]!;

    final availiableCategoryItems = MEALS_DATA
        .where((meal) => meal.categories.contains(catagoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, idx) {
          return CategoryItemTile(
            title: availiableCategoryItems[idx].title,
            imageUrl: availiableCategoryItems[idx].imageUrl,
            duration: availiableCategoryItems[idx].duration,
            complexity: availiableCategoryItems[idx].complexity,
            affordability: availiableCategoryItems[idx].affordability,
          );
        },
        itemCount: availiableCategoryItems.length,
      ),
    );
  }
}
