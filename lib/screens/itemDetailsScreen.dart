import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data.dart';

class ItemDetailsScreen extends StatelessWidget {
  // const ItemDetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String id = itemArgs['id']!;
    // final String id = 'm3';

    final itemSelected = MEALS_DATA.firstWhere((element) => element.id == id);
    print(itemArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text(itemSelected.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 3),
                ),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    itemSelected.imageUrl,
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text("Ingrediants:",
                  style: Theme.of(context).textTheme.title),
            ),
            Container(
                height: 180,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    // color: Theme.of(context).primaryColorDark,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Theme.of(context).primaryColorDark,
                  child: ListView.builder(
                      itemBuilder: (context, idx) {
                        return Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${itemSelected.ingredients[idx]}',
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ),
                        );
                      },
                      itemCount: itemSelected.ingredients.length),
                )),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text("Steps:", style: Theme.of(context).textTheme.title),
            ),
            Container(
                height: 180,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    // color: Theme.of(context).primaryColorDark,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(10),
                child: Card(
                  child: ListView.builder(
                      itemBuilder: (context, idx) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('${idx + 1}'),
                              ),
                              title: Text(itemSelected.steps[idx]),
                            ),
                            Divider(),
                          ],
                        );
                      },
                      itemCount: itemSelected.steps.length),
                )),
          ],
        ),
      ),
    );
  }
}
