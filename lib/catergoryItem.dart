import "package:flutter/material.dart";

class CatergoryItem extends StatelessWidget {
  // const CatergoryItem({ Key? key }) : super(key: key);
  final String title;
  final Color color;

  CatergoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)));
  }
}
