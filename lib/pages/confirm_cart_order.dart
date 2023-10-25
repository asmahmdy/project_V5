// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Order {
//   final int id;
//   final int idcustomer;
//   final List<OrderDetail> orderDetails;

//   Order({
//     required this.id,
//     required this.idcustomer,
//     required this.orderDetails,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) {
//     return Order(
//       id: json['id'],
//       idcustomer: json['idcustomer'],
//       orderDetails: (json['orderdetails'] as List)
//           .map((detail) => OrderDetail.fromJson(detail))
//           .toList(),
//     );
//   }
// }

// class OrderDetail {
//   final int id;
//   final int idorderctm;
//   final int idproduct;
//   final int amount;
//   final double sumPrice;

//   OrderDetail({
//     required this.id,
//     required this.idorderctm,
//     required this.idproduct,
//     required this.amount,
//     required this.sumPrice,
//   });

//   factory OrderDetail.fromJson(Map<String, dynamic> json) {
//     return OrderDetail(
//       id: json['id'],
//       idorderctm: json['idorderctm'],
//       idproduct: json['idproduct'],
//       amount: json['amount'],
//       sumPrice: json['sum_price'],
//     );
//   }
// }

// class ApiService {
//   final String baseUrl;

//   ApiService(this.baseUrl);

//   Future<Order> createOrder(int idcustomer) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/create-order/'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'idcustomer': idcustomer}),
//     );

//     if (response.statusCode == 201) {
//       return Order.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to create an order');
//     }
//   }

//   Future<List<OrderDetail>> getOrderDetails(int idorderctm) async {
//     final response = await http.get(Uri.parse('$baseUrl/api/orderdetails/'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data
//           .map((json) => OrderDetail.fromJson(json))
//           .where((detail) => detail.idorderctm == idorderctm)
//           .toList();
//     } else {
//       throw Exception('Failed to fetch order details');
//     }
//   }
// }

// class MyApp extends StatelessWidget {
//   final ApiService apiService = ApiService('https://your-django-api-url.com');

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Customer Orders'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () async {
//                   final order = await apiService
//                       .createOrder(1); // Replace with the actual customer ID
//                   print('Created Order: ${order.id}');
//                 },
//                 child: Text('Create Order'),
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   final orderDetails = await apiService
//                       .getOrderDetails(1); // Replace with the actual order ID
//                   for (final detail in orderDetails) {
//                     print(
//                         'Order Detail: ${detail.id}, Amount: ${detail.amount}');
//                   }
//                 },
//                 child: Text('Retrieve Order Details'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
