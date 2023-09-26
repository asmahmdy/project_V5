import 'package:flutter/material.dart';
import 'package:myapp/components/my_api.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/product_details_screens.dart';

// import 'package:myapp/pages/profile_screen.dart';

// import '../components/buttom_nav_bar.dart';

class showProduct extends StatefulWidget {
  const showProduct({super.key});

  @override
  State<showProduct> createState() => _showProductState();
}

class _showProductState extends State<showProduct> {
  List _products = [];
  List _getProfile = [];
  @override
  void initState() {
    super.initState();
    getProducts();
    get_profile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
        // actions: <Widget>[
        //   Padding(
        //       padding: EdgeInsets.only(left: 320.0),
        //       child: GestureDetector(
        //         onTap: () {
        //           Navigator.of(context).push(MaterialPageRoute(
        //               builder: (context) => ProfileScreen()));
        //         },
        //         child: Icon(
        //           Icons.person_2,
        //           size: 26.0,
        //         ),
        //       )),
        //   Padding(
        //       padding: const EdgeInsets.only(top: 20, right: 20),
        //       child: ListView.builder(
        //           itemCount: _getProfile.length,
        //           itemBuilder: (context, index) {
        //             return Text(
        //               '${_getProfile[index]['username']}',
        //               style: TextStyle(fontSize: 16),
        //             );
        //           }))
        // ]
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 50,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailsScreens(
                        nproduct: _products[index]['nproduct'],
                        sellPrice: _products[index]['selling_price'],
                        image: 'http://${URL()}/${_products[index]['image']}',
                        description: _products[index]['description'],
                      )),
            );
          },
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'http://${URL()}/${_products[index]['image']}',
                      fit: BoxFit.fill,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Text(_products[index]['nproduct']),
                  Text(
                    "${_products[index]['selling_price']} ฿",
                    style: TextStyle(color: Color.fromRGBO(46, 139, 216, 1)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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

  Future get_profile() async {
    var url = Uri.http(URL(), 'get-profile/${idcus()}/');
    var response = await http.get(url);
    var result = utf8.decode(response.bodyBytes);
    setState(() {
      _getProfile = json.decode(result);
      print(_getProfile);
    });
  }
}
