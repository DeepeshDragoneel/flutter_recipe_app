import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/widgets/hamburgerItems.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({Key? key}) : super(key: key);
  final Map<String, bool> filters;
  final Function applyFilters;

  FilterScreen(this.filters, this.applyFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Map<String, bool> filters = {
  //   'gluten': false,
  //   'lactose': false,
  //   'vegan': false,
  //   'vegetarian': false,
  // };

  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;

  @override
  initState() {
    print('Yo!');
    print(widget.filters);
    isGlutenFree = widget.filters['gluten'] as bool;
    isLactoseFree = widget.filters['lactose'] as bool;
    isVegan = widget.filters['vegan'] as bool;
    isVegetarian = widget.filters['vegetarian'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': isGlutenFree,
                    'lactose': isLactoseFree,
                    'vegan': isVegan,
                    'vegetarian': isVegetarian,
                  };
                  widget.applyFilters(selectedFilters);
                  Navigator.of(context).pushReplacementNamed('/');
                },
                icon: Icon(Icons.save_alt))
          ],
        ),
        drawer: Drawer(child: HamburgerMenuItems()),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Add Filters!',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  SwitchListTile(
                      title: Text("Gluteen Free"),
                      subtitle: Text("Include only Gluteen Free food!"),
                      value: isGlutenFree,
                      onChanged: (value) {
                        setState(() {
                          isGlutenFree = value;
                        });
                      }),
                  SwitchListTile(
                      title: Text("Lactose Free"),
                      subtitle: Text("Include only Lactose Free food!"),
                      value: isLactoseFree,
                      onChanged: (value) {
                        setState(() {
                          isLactoseFree = value;
                        });
                      }),
                  SwitchListTile(
                      title: Text("Vegan Food"),
                      subtitle: Text("Include only Vegan food!"),
                      value: isVegan,
                      onChanged: (value) {
                        setState(() {
                          isVegan = value;
                        });
                      }),
                  SwitchListTile(
                      title: Text("Vegetarian Food"),
                      subtitle: Text("Include only Vegetarian food!"),
                      value: isVegetarian,
                      onChanged: (value) {
                        setState(() {
                          isVegetarian = value;
                        });
                      }),
                ],
              ))
            ],
          ),
        ));
  }
}
