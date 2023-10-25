import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/components/buttom_nav_bar.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../../components/my_api.dart';

class CartPage extends StatefulWidget {
  final String nproduct;
  final String image;
  final int sellPrice;
  final int id;
  const CartPage(
      {super.key,
      required this.nproduct,
      required this.image,
      required this.sellPrice,
      required this.id});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _amount = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _nproduct, _image, _sellPrice, _id;

  double sumprice = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nproduct = widget.nproduct;
    _image = widget.image;
    _sellPrice = widget.sellPrice;
    _id = widget.id;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(children: [
          Card(
            child: Container(
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
                      Text('Selling Price : ${_sellPrice}'),
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: SizedBox(
                            width: 100,
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _amount,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Amount : "),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 300,
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
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => buttomBar()));
                      }
                      postCtmOrderDetail();
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    label: Text("Add to Cart"),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future postCtmOrderDetail() async {
    final url = Uri.http(URL(), 'post_ctm_order_datail');
    final headers = {"Content-type": "application/json"};
    setState(() {
      double amount = double.tryParse(_amount.text) ?? 0;
      sumprice = _sellPrice * amount;
    });
    final data = {
      "idproduct": _id.toString(),
      "idcustomer": idcus().toString(),
      "amount": int.tryParse(_amount.text) ?? 0,
      "sum_price": sumprice.toStringAsFixed(2),
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(data));

    print('--------result--------');
    print(response.body);
  }
}
