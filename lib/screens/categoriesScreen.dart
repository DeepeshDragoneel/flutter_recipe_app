import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/widgets/catergoryItem.dart';

import '../data.dart';

class CategoriesScreen extends StatelessWidget {
  final title;
  const CategoriesScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: CATEGORIES_DATA
          .map((e) => (CatergoryItem(e.id, e.title, e.color)))
          .toList(),
    );
  }
}
