import 'package:flutter/material.dart';
import 'package:myapp/pages/message.dart';
import 'package:myapp/pages/profile_screen.dart';
import '../pages/fix_detail.dart';
import '../pages/shop_page.dart';

class buttomBar extends StatefulWidget {
  const buttomBar({
    super.key,
  });

  @override
  State<buttomBar> createState() => _buttomBarState();
}

class _buttomBarState extends State<buttomBar> {
  int _selectedIndex = 0;

  static TextStyle get optionStyle =>
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    showProduct(),
    FixDetail(),
    ChatPage(),
    ProfileScreen(),
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
        selectedFontSize: 20,
        selectedIconTheme:
            IconThemeData(color: Color.fromRGBO(151, 187, 201, 1)),
        selectedItemColor: Color.fromRGBO(151, 187, 201, 1),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   backgroundColor: Color.fromARGB(255, 3, 68, 121),
          //   label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            backgroundColor: Color.fromARGB(255, 3, 68, 121),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            backgroundColor: Color.fromARGB(255, 3, 68, 121),
            label: 'Mr.Fixer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            backgroundColor: Color.fromARGB(255, 3, 68, 121),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Color.fromARGB(255, 3, 68, 121),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
