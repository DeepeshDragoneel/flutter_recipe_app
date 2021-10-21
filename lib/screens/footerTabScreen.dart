import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/screens/categoriesScreen.dart';
import 'package:flutter_recipe_app/screens/favoritesScreen.dart';
import 'package:flutter_recipe_app/widgets/hamburgerItems.dart';
import '../models/meal.dart';

class FooterTabScreen extends StatefulWidget {
  // const FooterTabScreen({Key? key}) : super(key: key);
  final List<Meal> favoriteItems;
  FooterTabScreen(this.favoriteItems);

  @override
  _FooterTabScreenState createState() => _FooterTabScreenState();
}

class _FooterTabScreenState extends State<FooterTabScreen> {
  List<Map<String, Object>> tabs = [];

  @override
  initState() {
    tabs = [
      {
        'title': 'Recipe App',
        'widget': CategoriesScreen(
          title: "Recipe App",
        ),
      },
      {
        'title': 'Favorites',
        'widget': FavoritesScreen(widget.favoriteItems),
      }
    ];
    super.initState();
  }

  int selectedTab = 0;

  void SelectTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tabs[selectedTab]['title'].toString())),
      drawer: Drawer(child: HamburgerMenuItems()),
      body: tabs[selectedTab]['widget'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          onTap: SelectTab,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: selectedTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            )
          ]),
    );
  }
}

//MENU BLOW APP BAR
// DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//               title: Text('Recipe App'),
//               bottom: TabBar(tabs: [
//                 Tab(
//                   icon: Icon(Icons.category),
//                   text: 'Categories',
//                 ),
//                 Tab(
//                   icon: Icon(Icons.star),
//                   text: 'Favorites',
//                 )
//               ])),
//           body: TabBarView(children: [
//             CategoriesScreen(title: 'Meals App'),
//             FavoritesScreen(),
//           ]),
//         ));