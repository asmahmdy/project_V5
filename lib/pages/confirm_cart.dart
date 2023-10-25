import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/components/buttom_nav_bar.dart';
import '../components/my_api.dart';

class ConfirmCart extends StatefulWidget {
  const ConfirmCart({
    super.key,
  });

  @override
  State<ConfirmCart> createState() => _ConfirmCartState();
}

class _ConfirmCartState extends State<ConfirmCart> {
  List _ProductInCart = [];
  double sumPrice = 0.0;
  double totalSumPrice = 0.0;
  int idorder = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCtmOrderDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Cart"),
          backgroundColor: Color.fromRGBO(11, 74, 126, 1),
        ),
        backgroundColor: (Colors.white),
        body: Column(children: [
          SizedBox(
            height: 10,
          ),
          getProductInCart(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30, bottom: 20),
                child: Text(
                  "Total Price : ${totalSumPrice}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 3, 68, 121))),
                    onPressed: () {
                      {
                        createOrderAndOrderDetails();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => buttomBar()));
                      }
                      // post_ctm_order();
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    label: Text("Confirm Order"),
                  ),
                )
              ],
            ),
          ),
        ]));
  }

  Widget getProductInCart() {
    return Expanded(
        child: ListView.builder(
            itemCount: _ProductInCart.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  width: MediaQuery.of(context).size.width - 348,
                  child: Row(children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'http://${URL()}/${_ProductInCart[index]['image']}',
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${_ProductInCart[index]['nproduct']}"),
                          Text(
                              "Selling Price : ${_ProductInCart[index]['selling_price']} ฿"),
                          Text(
                              "Quantity of products you ordered : ${_ProductInCart[index]['amount']}"),
                          Text(
                              "Price : ${_ProductInCart[index]['sum_price']} ฿"),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Row(
                        children: [
                          IconButton(
                              color: Color.fromARGB(255, 212, 10, 10),
                              onPressed: () {
                                {
                                  Navigator.of(context).pop(MaterialPageRoute(
                                      builder: (context) => buttomBar()));
                                }
                                DeleteCtmOrderDetail();
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            }));
  }

  Future getCtmOrderDetail() async {
    var url = Uri.http(URL(), 'get_ctm_order_datail');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    setState(() {
      _ProductInCart = json.decode(result);
      for (int i = 0; i < _ProductInCart.length; i++) {
        totalSumPrice += _ProductInCart[i]['sum_price'];
      }
    });
  }

  Future DeleteCtmOrderDetail() async {
    var url = Uri.http(URL(), 'delete_ctm_order_datail');
    var response = await http.delete(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    setState(() {
      _ProductInCart = json.decode(result);
      print(_ProductInCart);
      idorder = _ProductInCart[0]['id'];
    });
  }

  Future createOrderAndOrderDetails() async {
    var orderUrl = Uri.http(URL(), 'post_ctm_cart');

    Map<String, String> header = {"Content-type": "application/json"};

    String v1 = '"idorderctm":"$idorder"';
    String v2 = '"idcustomer":"${idcus()}"';
    //  String v3 = '"amount":"${_amount}"';
    String v4 = '"total":"${totalSumPrice}"';
    String jsondata = '{$v1,$v2,$v4}';
    var response = await http.post(orderUrl, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}
