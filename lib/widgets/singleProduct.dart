// import 'package:flutter/material.dart';
// // i
// import 'package:myapp/pages/product_details_screens.dart';

// class SingleProduct extends StatelessWidget {
//   final int id;
//   final String title;
//   final String image;
//   final bool favorit;

//   const SingleProduct({
//     required Key key,
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.favorit,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GridTile(
//       child: GestureDetector(
//         onTap: () {
//           Navigator.of(context).pushNamed(
//             ProductDetailsScreens.routeName,
//             arguments: id,
//           );
//         },
//         child: Image.network(
//           "http://192.168.61.250:8000$image",
//           fit: BoxFit.cover,
//         ),
//       ),
//       footer: GridTileBar(
//         backgroundColor: Colors.black54,
//         title: Text(title),
//       ),
//     );
//   }
// }
