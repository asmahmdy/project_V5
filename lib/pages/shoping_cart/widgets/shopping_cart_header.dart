import 'package:flutter/material.dart';

class ShoppingCartHeader extends StatefulWidget {
  const ShoppingCartHeader({
    super.key,
  });

  @override
  State<ShoppingCartHeader> createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: .5, color: Colors.grey))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Text('Shoping Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
          ],
        ),
      ),
    );
  }
}
