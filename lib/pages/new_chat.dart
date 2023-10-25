import 'package:flutter/material.dart';
import 'package:myapp/components/my_api.dart';
import 'package:myapp/pages/chat_screen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var msg = TextEditingController();
  String msgsend = "";
  List _msg = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      // body: Column(
      //   children: <Widget>[
      //     Flexible(
      //       child: ListView.builder(
      //         padding: EdgeInsets.all(8.0),
      //         reverse: true,
      //         itemCount: _msg.length,
      //         itemBuilder: (_, int index) => _msg[index],
      //       ),
      //     ),
      //     Divider(height: 1.0),
      //     Container(
      //       decoration: BoxDecoration(color: Theme.of(context).cardColor),
      //       // child: _buildTextComposer(),
      //     ),
      //   ],
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(msgsend), send()],
      ),
    );
  }

  Widget send() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 110, 83, 83)),
        child: Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: msg,
                decoration:
                    const InputDecoration(hintText: "Enter your message"),
              ),
            ),
            IconButton(
                onPressed: () {
                  postmsg();
                  setState(() {
                    msgsend = msg.text;
                    msg.clear();
                  });
                },
                icon: Icon(Icons.send))
          ],
        ),
      ),
    );
  }

  Future postmsg() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'post-msg');
    Map<String, String> header = {"Content-type": "application/json"};
    String v1 = '"msg":"${msg.text}"';
    String v2 = '"idcus" : "${idcus()}"';

    String jsondata = '{$v1,$v2}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
    setState(() {});
  }
}
