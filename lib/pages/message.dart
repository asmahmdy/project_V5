import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:myapp/components/my_api.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _message = TextEditingController();
  List<Message> messages = [
    Message(
        text: 'มีเรื่องจะปรึกษาค่ะ', date: DateTime.now(), isSentByme: true),
    // Message(
    //     text: 'Ayo!!!',
    //     date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
    //     isSentByme: true),
    // Message(
    //     text: 'Wow',
    //     date: DateTime.now().subtract(Duration(minutes: 1)),
    //     isSentByme: false),
    // Message(
    //     text: 'Opps',
    //     date: DateTime.now().subtract(Duration(minutes: 1)),
    //     isSentByme: false),
  ].reversed.toList();
  // List<Message> message = [
  //   Message(text: 'dfmk', date: DateTime.now(), isSentByme: true)
  // ].reversed.toList();
  List _msg = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_msg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                  message.date.year, message.date.month, message.date.day),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 60,
                child: Center(
                  child: Card(
                    color: Theme.of(context).hoverColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByme
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Card(
                  color: Color.fromRGBO(11, 74, 126, 1),
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      message.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'dfv',
                // ' ${_msg[0]['reply']}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),

          Container(
            width: MediaQuery.of(context).size.width - 35,
            child: Card(
              margin: EdgeInsets.only(left: 8, right: 2, bottom: 8),
              color: Color.fromARGB(255, 159, 214, 241),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _message,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  hintText: 'Type your message here...',
                ),
                onSubmitted: (text) {
                  final message = Message(
                      text: text, date: DateTime.now(), isSentByme: true);
                  postmsg();
                  setState(() => messages.add(message));
                  TextStyle(
                    backgroundColor: Color.fromRGBO(11, 74, 126, 1),
                    color: Colors.white,
                  );
                },
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 5.0),
          //   child: IconButton(
          //     icon: Icon(Icons.send),
          //     onPressed: () {
          //       postmsg();
          //     },
          //     iconSize: 26,
          //   ),
          // ),
        ],
      ),
    );
  }

  Future postmsg() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'post-msg');
    Map<String, String> header = {"Content-type": "application/json"};
    String v1 = '"msg":"${_message.text}"';
    String v2 = '"idcus" : "${idcus()}"';

    String jsondata = '{$v1,$v2}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }

  Future get_msg() async {
    var url = Uri.http(URL(), 'get-msg/${idcus}');
    var response = await http.get(url);
    var result = json.decode(response.body);
    setState(() {
      _msg = json.decode(result);
    });
  }
}
