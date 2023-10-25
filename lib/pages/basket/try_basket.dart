import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../../components/my_api.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    // Fetch cart items from your Django API
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    final response = await http.get(Uri.parse('$URL/post_ctm_order_datail'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<CartItem> items =
          data.map((item) => CartItem.fromJson(item)).toList();
      setState(() {
        cartItems = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
            trailing: Text('Quantity: ${item.quantity}'),
            // Add buttons to update quantity or remove items
            // onPressed: () {
            //   // Implement actions for updating and removing items
            // },
          );
        },
      ),
      // Add a checkout button and total price calculation
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Implement checkout logic
      //   },
      //   child: Text('Checkout \$TOTAL_PRICE'),
      // ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({required this.name, required this.price, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
    );
  }
}
