import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/screens/categoriesScreen.dart';
import 'package:flutter_recipe_app/screens/categoryAvailiableItems.dart';
import 'package:flutter_recipe_app/screens/filterScreen.dart';
import 'package:flutter_recipe_app/screens/footerTabScreen.dart';
import 'package:flutter_recipe_app/screens/itemDetailsScreen.dart';
import './data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availiableItems = MEALS_DATA;

  void applyFilters(Map<String, bool> newFilters) {
    setState(() {
      filters = newFilters;
      availiableItems = availiableItems.where((element) {
        if (filters['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] == true && !element.isVegan) {
          return false;
        }
        if (filters['vegetarian'] == true && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  Map<int, Color> color = {
    50: Color.fromRGBO(85, 246, 240, .1),
    100: Color.fromRGBO(85, 246, 240, .2),
    200: Color.fromRGBO(85, 246, 240, .3),
    300: Color.fromRGBO(85, 246, 240, .4),
    400: Color.fromRGBO(85, 246, 240, .5),
    500: Color.fromRGBO(85, 246, 240, .6),
    600: Color.fromRGBO(85, 246, 240, .7),
    700: Color.fromRGBO(85, 246, 240, .8),
    800: Color.fromRGBO(85, 246, 240, .9),
    900: Color.fromRGBO(85, 246, 240, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFF2196F3, color),
          accentColor: Color.fromRGBO(241, 227, 125, 1),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontWeight: FontWeight.bold),
              title: TextStyle(
                fontSize: 24.5,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: FooterTabScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => FooterTabScreen(),
        '/availiableCategoryItems': (context) =>
            CategoryAvailiableItems(availiableItems),
        '/itemDetails': (context) => ItemDetailsScreen(),
        '/filters': (context) => FilterScreen(filters, applyFilters),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => CategoriesScreen(title: "Recipe App"));
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => CategoriesScreen(title: "Recipe App"));
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
