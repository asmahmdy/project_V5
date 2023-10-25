import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  // final String nproduct;
  // final String image;
  // final int sellPrice;
  // final String description;
  // final int id;
  Body({
    super.key,
    // required this.nproduct, required this.image, required this.sellPrice, required this.description, required this.id
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // List _products = [];
  // var v1, v2, v3, v4, v5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Column(children: [
          // ShoppingCartEmpty()
          Column(
            children: [],
          )
        ]));
  }
}
