// import 'package:flutter/material.dart';

// import '../components/my_api.dart';

// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ChatApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChatScreen(),
//     );
//   }
// }

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<ChatMessage> _messages = [];
//   final TextEditingController _textController = TextEditingController();

//   void _handleSubmitted(String text) {
//     if (text.isNotEmpty) {
//       _textController.clear();
//       ChatMessage message = ChatMessage(
//         text: text,
//         isUser: true,
//       );
//       setState(() {
//         _messages.insert(0, message);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat App'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: _messages.length,
//               itemBuilder: (_, int index) => _messages[index],
//             ),
//           ),
//           Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(color: Colors.grey[200]),
//             child: _buildTextComposer(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextComposer() {
//     return IconTheme(
//       data: IconThemeData(color: Colors.blue),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: <Widget>[
//             Flexible(
//               child: TextField(
//                 controller: _textController,
//                 onSubmitted: _handleSubmitted,
//                 decoration: InputDecoration.collapsed(
//                   hintText: 'Send a message',
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.send),
//               onPressed: () => _handleSubmitted(_textController.text),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   final String text;
//   final bool isUser;

//   ChatMessage({required this.text, required this.isUser});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//       child: Row(
//         mainAxisAlignment:
//             isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: <Widget>[
//           if (!isUser) CircleAvatar(),
//           Flexible(
//             child: Container(
//               padding: EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 color: isUser ? Colors.blue : Colors.grey,
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16.0,
//                 ),
//               ),
//             ),
//           ),
//           // if (isUser) CircleAvatar(),
//         ],
//       ),
//     );
//   }

//   // Future postmsg() async {
//   //   // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
//   //   var url = Uri.http(URL(), 'post-msg');
//   //   Map<String, String> header = {"Content-type": "application/json"};
//   //   String v1 = '"msg":"${_textController.text}"';
//   //   String v2 = '"idcus" : "${idcus()}"';

//   //   String jsondata = '{$v1,$v2}';
//   //   var response = await http.post(url, headers: header, body: jsondata);
//   //   print('--------result--------');
//   //   print(response.body);
//   //   setState(() {
//   //     get_msg();
//   //   });
//   // }
// }
