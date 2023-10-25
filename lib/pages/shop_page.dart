import 'package:flutter/material.dart';
import 'package:myapp/components/my_api.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/confirm_cart.dart';
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
    post_ctm_cart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
        automaticallyImplyLeading: false,

        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart), // You can use any icon you prefer
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConfirmCart()));
            },
          ),
        ],
        // actions: <Widget>[
        //   PopupMenuButton<int>(
        //     icon: Icon(Icons.person), // Add an icon for the popup menu
        //     onSelected: (int index) {
        //       // Handle the selection here
        //       print('Selected: ${_getProfile[index]['username']}');
        //     },
        //     itemBuilder: (BuildContext context) {
        //       return List<PopupMenuEntry<int>>.generate(
        //         _getProfile.length,
        //         (int index) {
        //           return PopupMenuItem<int>(
        //             value: index,
        //             child: Text('${_getProfile[index]['username']}'),
        //             onTap: () {
        //               Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) => ProfileScreen()));
        //             },
        //           );
        //         },
        //       );
        //     },
        //   ),
        // ],
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
                        id: _products[index]['id'],
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
    var url = Uri.http(URL(), 'get-profile/${idcus()}');
    var response = await http.get(url);
    var result = utf8.decode(response.bodyBytes);
    setState(() {
      _getProfile = json.decode(result);
      print(_getProfile);
    });
  }

  Future post_ctm_cart() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'post_ctm_cart');
    Map<String, String> header = {"Content-type": "application/json"};
    String v1 = '"idcustomer":"${idcus()}"';
    String jsondata = '{$v1}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}
