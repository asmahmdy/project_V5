import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  final String nproduct;
  final String image;
  final int sellPrice;
  final int amount;
  final int id;

  ItemCart({
    Key? key,
    required this.nproduct,
    required this.image,
    required this.sellPrice,
    required this.id,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
            image), // You may need to use Image.asset if using local images.
        title: Text(nproduct),
        subtitle: Text('Price: \$${sellPrice.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Quantity: $amount'),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // You can add code to remove this item from the cart here.
              },
            ),
          ],
        ),
      ),
    );
  }
}
