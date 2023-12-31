import 'package:flutter/material.dart';
import 'package:myapp/pages/confirm_order.dart';

class OrderScreen extends StatefulWidget {
  final String nproduct;
  final String image;
  final int sellPrice;
  final int id;
  const OrderScreen({
    super.key,
    required this.nproduct,
    required this.image,
    required this.sellPrice,
    required this.id,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _amount = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var v1, v2, v3, v4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    v1 = widget.nproduct;
    v2 = widget.image;
    v3 = widget.sellPrice;
    v4 = widget.id;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Product"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Row(children: [
                Image.network(
                  "${widget.image}",
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
                      Text(widget.nproduct),
                      Text('Selling Price : ${widget.sellPrice} ฿'),
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
                                  return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                                }
                                return null; // No error
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
                            builder: (context) => ConfirmOrder(
                                  nproduct: v1,
                                  image: v2,
                                  sellPrice: v3,
                                  amount: int.parse(_amount.text),
                                  idproduct: v4,
                                )));
                      }
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    label: Text("Order"),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
