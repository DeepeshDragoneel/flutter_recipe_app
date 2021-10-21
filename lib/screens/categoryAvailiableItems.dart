import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data.dart';
import 'package:flutter_recipe_app/widgets/categoryItemTile.dart';
import '../models/meal.dart';

class CategoryAvailiableItems extends StatefulWidget {
  // const CategoryAvailiableItems({ Key? key }) : super(key: key);

  // CategoryAvailiableItems(this.CatagoryId, this.Categorytitle);

  final List<Meal> availiableItems;
  CategoryAvailiableItems(this.availiableItems);

  @override
  _CategoryAvailiableItemsState createState() =>
      _CategoryAvailiableItemsState();
}

class _CategoryAvailiableItemsState extends State<CategoryAvailiableItems> {
  String categorytitle = 'Error';
  List<Meal> availiableCategoryItems = [];
  var loadedDataOnce = false;

  @override
  void initState() {
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final String catagoryId = routeArgs["id"]!;
    // categorytitle = routeArgs["title"]!;

    // availiableCategoryItems = MEALS_DATA
    //     .where((meal) => meal.categories.contains(catagoryId))
    //     .toList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedDataOnce) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final String catagoryId = routeArgs["id"]!;
      categorytitle = routeArgs["title"]!;

      availiableCategoryItems = widget.availiableItems
          .where((meal) => meal.categories.contains(catagoryId))
          .toList();
      loadedDataOnce = true;
    }
    super.didChangeDependencies();
  }

  void removeRecipe(String recipeId) {
    setState(() {
      availiableCategoryItems.removeWhere((element) => element.id == recipeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, idx) {
          return CategoryItemTile(
            id: availiableCategoryItems[idx].id,
            title: availiableCategoryItems[idx].title,
            imageUrl: availiableCategoryItems[idx].imageUrl,
            duration: availiableCategoryItems[idx].duration,
            complexity: availiableCategoryItems[idx].complexity,
            affordability: availiableCategoryItems[idx].affordability,
            // removeRecipe: removeRecipe,
          );
        },
        itemCount: availiableCategoryItems.length,
      ),
    );
  }
}
