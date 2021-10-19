import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/models/meal.dart';

class CategoryItemTile extends StatelessWidget {
  // const CategoryItemTile({ Key? key }) : super(key: key);

  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  CategoryItemTile(
      {required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  void showItemDetails() {}

  String get ComplexityText{
    if(complexity == Complexity.Simple){
      return 'Simple';
    }
    else if(complexity == Complexity.Hard){
      return 'Hard';
    }
    else if(complexity == Complexity.Challenging){
      return 'Challenging';
    }
    else{
      return 'UnKnown!';
    }
  }
  String get AffordabilityText{
    if(affordability == Affordability.Affordable){
      return "Affordable";
    }
    
    else if(affordability == Affordability.Luxurious){
      return "Luxurious";
    }
    
    else if(affordability == Affordability.Pricey){
      return "Pricey";
    }
    else{
      return "Unknown!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showItemDetails(),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(children: [
                  Icon(Icons.schedule_outlined),
                  SizedBox(width: 5),
                  Text('${duration} min')
                ],),
                Row(children: [
                  Icon(Icons.work_outline_sharp),
                  SizedBox(width: 5),
                  Text(ComplexityText)
                ],),
                Row(children: [
                  Icon(Icons.monetization_on_outlined),
                  SizedBox(width: 5),
                  Text(AffordabilityText)
                ],),
              ],
            )
          )],
        ),
      ),
    );
  }
}
