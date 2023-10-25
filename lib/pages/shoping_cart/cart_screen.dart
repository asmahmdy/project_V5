import 'package:flutter/material.dart';

import 'widgets/body.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.white),
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar();
  }
}
