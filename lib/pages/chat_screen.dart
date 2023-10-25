// // import 'package:flutter/material.dart';

// // import 'package:myapp/components/my_api.dart';

// // import 'dart:async';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // void main() => runApp(ChatApp());

// // class ChatApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: ChatScreen(),
// //     );
// //   }
// // }

// // class ChatScreen extends StatefulWidget {
// //   @override
// //   State createState() => ChatScreenState();
// // }

// // class ChatScreenState extends State<ChatScreen> {
// //   final List<ChatMessage> _messages = [];
// //   var _textController = TextEditingController();

// //   void _handleSubmitted(String text) {
// //     _textController.clear();
// //     ChatMessage message = ChatMessage(
// //       text: text,
// //       isUser: true,
// //     );
// //     setState(() {
// //       _messages.insert(0, message);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Chat App'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           Flexible(
// //             child: ListView.builder(
// //               padding: EdgeInsets.all(8.0),
// //               reverse: true,
// //               itemCount: _messages.length,
// //               itemBuilder: (_, int index) => _messages[index],
// //             ),
// //           ),
// //           Divider(height: 1.0),
// //           Container(
// //             decoration: BoxDecoration(color: Theme.of(context).cardColor),
// //             child: _buildTextComposer(),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTextComposer() {
// //     return IconTheme(
// //       data: IconThemeData(color: Theme.of(context).cardColor),
// //       child: Container(
// //         margin: const EdgeInsets.symmetric(horizontal: 8.0),
// //         child: Row(
// //           children: <Widget>[
// //             Flexible(
// //               child: TextField(
// //                 controller: _textController,
// //                 decoration:
// //                     InputDecoration.collapsed(hintText: 'Send a message'),
// //               ),
// //             ),
// //             IconButton(
// //               icon: Icon(
// //                 Icons.send,
// //                 color: Colors.black,
// //               ),
// //               onPressed: () {
// //                 // sendMsg(_textController.text, true);
// //                 print(_textController);
// //                 postmsg(_textController.text);
// //                 _textController.clear();
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget sendMsg(String text, bool isUser) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 10.0),
// //       child: Row(
// //         mainAxisAlignment:
// //             isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
// //         children: <Widget>[
// //           if (!isUser) CircleAvatar(), // Add user avatars here
// //           Flexible(
// //             child: Container(
// //               padding: const EdgeInsets.all(8.0),
// //               decoration: BoxDecoration(
// //                 color: isUser ? Colors.blue : Colors.grey,
// //                 borderRadius: BorderRadius.circular(8.0),
// //               ),
// //               child: Text(
// //                 text,
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //             ),
// //           ),
// //           // if (isUser) CircleAvatar(), // Add user avatars here
// //         ],
// //       ),
// //     );
// //   }

// //   Future postmsg(String msg) async {
// //     // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
// //     var url = Uri.http(URL(), 'post-msg');
// //     Map<String, String> header = {"Content-type": "application/json"};
// //     String v1 = '"msg":"${msg}"';
// //     String v2 = '"idcus" : "${idcus()}"';

// //     String jsondata = '{$v1,$v2}';
// //     var response = await http.post(url, headers: header, body: jsondata);
// //     print('--------result--------');
// //     print(response.body);
// //   }
// // }

// // class ChatMessage extends StatelessWidget {
// //   final String text;
// //   final bool isUser;

// //   ChatMessage({required this.text, required this.isUser});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 10.0),
// //       child: Row(
// //         mainAxisAlignment:
// //             isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
// //         children: <Widget>[
// //           if (!isUser) CircleAvatar(), // Add user avatars here
// //           Flexible(
// //             child: Container(
// //               padding: const EdgeInsets.all(8.0),
// //               decoration: BoxDecoration(
// //                 color: isUser ? Colors.blue : Colors.grey,
// //                 borderRadius: BorderRadius.circular(8.0),
// //               ),
// //               child: Text(
// //                 text,
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //             ),
// //           ),
// //           // if (isUser) CircleAvatar(), // Add user avatars here
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(ChatApp());
// }

// class ChatApp extends StatefulWidget {
//   @override
//   _ChatAppState createState() => _ChatAppState();
// }

// class _ChatAppState extends State<ChatApp> {
//   final List<String> messages = [];
//   final TextEditingController messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Chat App'),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(messages[index]),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: messageController,
//                       decoration: InputDecoration(labelText: 'Type a message'),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.send),
//                     onPressed: () {
//                       final message = messageController.text;
//                       if (message.isNotEmpty) {
//                         messages.add(message);
//                         messageController.clear();
//                         setState(() {});
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
