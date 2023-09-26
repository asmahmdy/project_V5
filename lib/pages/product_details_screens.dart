import 'package:flutter/material.dart';
import 'package:myapp/pages/order_screen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cart_screen.dart';
import 'package:myapp/components/my_api.dart';

class ProductDetailsScreens extends StatefulWidget {
  final String nproduct;
  final String image;
  final int sellPrice;
  final String description;

  ProductDetailsScreens({
    super.key,
    required this.nproduct,
    required this.image,
    required this.sellPrice,
    required this.description,
  });

  @override
  State<ProductDetailsScreens> createState() => _ProductDetailsScreensState();
}

class _ProductDetailsScreensState extends State<ProductDetailsScreens> {
  List _products = [];
  var v1, v2, v3, v4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    v1 = widget.nproduct;
    v2 = widget.image;
    v3 = widget.sellPrice;
    v4 = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Image.network(
                "${widget.image}",
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.nproduct),
                  Text('Selling Price : ${widget.sellPrice} ฿'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(widget.description),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CartScreen())),
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        label: Text("Add to cart"),
                      )),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 3, 68, 121))),
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OrderScreen(
                                  nproduct: v1,
                                  image: v2,
                                  sellPrice: v3,
                                ))),
                    icon: Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.white,
                    ),
                    label: Text("Buy Now"),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Future getProducts() async {
    var url = Uri.http(URL(), 'get-products/');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    setState(() {
      _products = json.decode(result);
      print(_products);
    });
  }
}
