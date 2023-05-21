import 'package:app/main/home.dart';
import 'package:app/mandatory/kesan.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../mandatory/profile.dart';
import 'logout.dart';
import 'riwayat.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;
  final TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Identity(),
    const Kesan(),
    const Logout(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey.shade100,
          items: const <Widget>[
            Icon(Icons.menu, size: 30),
            Icon(Icons.info, size: 30),
            Icon(Icons.person, size: 30),
            Icon(Icons.logout_outlined, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
            _onItemTapped(index);
          }),
      body: Center(
        child: Container(
            color: Colors.grey.shade100,
            child: _widgetOptions.elementAt(_selectedIndex)),
      ),
    );
  }
}
