import "package:flutter/material.dart";
import 'package:flutter_recipe_app/categoryAvailiableItems.dart';

class CatergoryItem extends StatelessWidget {
  // const CatergoryItem({ Key? key }) : super(key: key);
  final String title;
  final Color color;

  CatergoryItem(this.title, this.color);

  void SelectedCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return CategoryAvailiableItems();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectedCategory(context),
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
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
