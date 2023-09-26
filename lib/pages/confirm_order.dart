import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/banking.dart';
import '../components/my_api.dart';

class ConfirmOrder extends StatefulWidget {
  final String nproduct;
  final String image;
  final int sellPrice;
  final int amount;
  const ConfirmOrder(
      {super.key,
      required this.nproduct,
      required this.image,
      required this.sellPrice,
      required this.amount});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  List _products = [];
  var _nproduct, _image, _sellPrice, _amount;
  int total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nproduct = widget.nproduct;
    _image = widget.image;
    _sellPrice = widget.sellPrice;
    _amount = widget.amount;
    total = _sellPrice * _amount;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Confirm Order"),
          backgroundColor: Color.fromRGBO(11, 74, 126, 1),
        ),
        body: Padding(
            padding: const EdgeInsets.all(18),
            child: ListView(children: [
              Container(
                child: Row(children: [
                  Image.network(
                    "${_image}",
                    fit: BoxFit.fill,
                    height: 150,
                    width: 150,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_nproduct),
                          ])),
                ]),
              ),
              SizedBox(
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 230),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selling Price : ${_sellPrice} ฿',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Amount : ${_amount} ฿',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Total : ${total} ฿',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 3, 68, 121))),
                        onPressed: () {
                          post_ctm_order();
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                title: const Text('Make Payment'),
                                content: const Text('กรุณาชำระเงิน'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Banking()));
                                    },
                                    child: const Text('OK'),
                                  ),
                                ]),
                          );
                        },
                        icon: Icon(
                          Icons.payment,
                          color: Colors.white,
                        ),
                        label: Text("Confirm"),
                      ),
                    )
                  ],
                ),
              ),
            ])));
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

  Future post_ctm_order() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'post_ctm_order/id');
    Map<String, String> header = {"Content-type": "application/json"};
    String v1 = '"nproduct":"${_nproduct.text}"';
    String v2 = '"selling_price":"${_sellPrice.text}"';
    String v3 = '"amount":"${_amount.text}"';
    String v4 = '"sum_price":"${total}"';
    String jsondata = '{$v1,$v2,$v3,$v4}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}
