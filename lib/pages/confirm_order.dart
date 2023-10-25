import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:myapp/components/buttom_nav_bar.dart';
import '../components/my_api.dart';

class ConfirmOrder extends StatefulWidget {
  final String nproduct;
  final String image;
  final int sellPrice;
  final int amount;
  final int idproduct;
  const ConfirmOrder(
      {super.key,
      required this.nproduct,
      required this.image,
      required this.sellPrice,
      required this.amount,
      required this.idproduct});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  var _idpd, _nproduct, _image, _sellPrice, _amount;
  int total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _idpd = widget.idproduct;
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "${_image}",
                      fit: BoxFit.fill,
                      height: 150,
                      width: 150,
                    ),
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
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 3, 68, 121)),
                  ),
                  onPressed: () {
                    {
                      post_ctm_order();

                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                            title: const Text('Order'),
                            content:
                                const Text('คุณสั่งซื้อสินค้าเรียบร้อยแล้ว'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return buttomBar();
                                    },
                                  ),
                                ),
                                child: const Text('OK'),
                              ),
                            ]),
                      );
                    }
                  },
                  child: Text("Confirm"))
              // Padding(
              //   padding: const EdgeInsets.only(left: 130),
              //   child: ElevatedButton(
              //     style: const ButtonStyle(
              //       backgroundColor: MaterialStatePropertyAll<Color>(
              //           Color.fromARGB(255, 3, 68, 121)),
              //     ),
              //     onPressed: () {
              //       post_ctm_order();
              //       setState(() {});
              //     },
              //     child: const Text('Confirm'),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 80),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Directionality(
              //         textDirection: TextDirection.rtl,
              //         child: ElevatedButton.icon(
              //           style: ButtonStyle(
              //               backgroundColor: MaterialStatePropertyAll<Color>(
              //                   Color.fromARGB(255, 3, 68, 121))),
              //           onPressed: () {
              //             post_ctm_order();
              //               showDialog<String>(
              //                 context: context,
              //                 builder: (BuildContext context) => AlertDialog(
              //                     title: const Text('Make Payment'),
              //                     content: const Text('กรุณาชำระเงิน'),
              //                     actions: <Widget>[
              //                       TextButton(
              //                         onPressed: () {
              //                           Navigator.push(
              //                               context,
              //                               MaterialPageRoute(
              //                                   builder: (context) => Banking()));
              //                         },
              //                         child: const Text('OK'),
              //                       ),
              //                     ]),
              //               );
              //           },
              //           icon: Icon(
              //             Icons.payment,
              //             color: Colors.white,
              //           ),
              //           label: Text("Confirm"),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ])));
  }

  Future post_ctm_order() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'post_ctm_order');
    Map<String, String> header = {"Content-type": "application/json"};

    String v1 = '"idproduct":"${_idpd}"';
    String v2 = '"idcustomer":"${idcus()}"';
    String v3 = '"amount":"${_amount}"';
    String v4 = '"total":"${total}"';
    String jsondata = '{$v1,$v2,$v3,$v4}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}
