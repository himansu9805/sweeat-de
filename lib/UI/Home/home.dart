import 'package:flutter/material.dart';
import 'package:project_sweeat/UI/Cart/cart.dart';
import 'package:project_sweeat/UI/Profile/profile.dart';

import 'main_home.dart';
import '../Maps/maps.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MainHome(),
    Maps(),
    Cart(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            activeIcon: Icon(
              Icons.food_bank_rounded,
              color: Color(0xfff6929b),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(
              Icons.map_rounded,
              color: Color(0xff147c3c),
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(
              Icons.shopping_cart_rounded,
              color: Color(0xffb4a4ce),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(
              Icons.person_rounded,
              color: Colors.orange,
            ),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(color: Colors.black45, size: 30),
        selectedItemColor: Colors.amber[800],
        unselectedIconTheme: IconThemeData(color: Colors.black38, size: 28),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
