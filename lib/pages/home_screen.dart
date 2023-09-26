import 'package:flutter/material.dart';
import 'package:myapp/components/buttom_nav_bar.dart';
import 'package:myapp/pages/chat_screen.dart';
import 'package:myapp/pages/fix_detail.dart';
import 'package:myapp/pages/fixer.dart';
import 'package:myapp/pages/shop_page.dart';
// import 'package:myapp/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: GridView.count(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 50,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              buttomBar();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FixerPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                image: const DecorationImage(
                  image: AssetImage('assets/images/fixer.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Mr.Fixer'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FixDetail()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                image: const DecorationImage(
                  image: AssetImage('assets/images/detail.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Detail Mr.Fixer'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => showProduct()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                image: const DecorationImage(
                  image: AssetImage('assets/images/shop.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Shop'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                image: const DecorationImage(
                  image: AssetImage('assets/images/chat.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('Chat'),
            ),
          ),
        ],
      ),
    );
  }
}
