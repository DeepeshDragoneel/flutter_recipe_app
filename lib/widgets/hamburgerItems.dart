import 'package:flutter/material.dart';

class HamburgerMenuItems extends StatelessWidget {
  const HamburgerMenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.bottomLeft,
          color: Theme.of(context).primaryColor,
          child: Text(
            'Menu',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant_sharp,
            size: 24,
          ),
          title: Text('Recipies',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.filter_list_alt,
            size: 24,
          ),
          title: Text('Filters',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/filters');
          },
        )
      ],
    ));
  }
}
