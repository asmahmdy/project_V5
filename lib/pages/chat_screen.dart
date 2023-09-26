import 'package:flutter/material.dart';
import 'dart:async';
// import 'dart:convert';
import 'package:http/http.dart' as http;
import '../components/my_api.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _message = TextEditingController();

  // List _msg = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: 50,
                decoration: BoxDecoration(color: Colors.white),
                child: Text("1"),
              ),
              Container(
                height: 100,
                width: 50,
                decoration: BoxDecoration(color: Colors.white),
                child: Text("3"),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 55,
                  child: Card(
                    margin: EdgeInsets.only(left: 8, right: 2, bottom: 8),
                    color: Color.fromARGB(255, 159, 214, 241),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: _message,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "    Type a message",
                      ),
                      // suffixIcon: Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     IconButton(
                      //         onPressed: () {},
                      //         icon: Icon(Icons.attach_file)),
                      //     IconButton(
                      //         onPressed: () {},
                      //         icon: Icon(Icons.camera_alt))
                      //   ],
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      postmsg();
                    },
                    iconSize: 26,
                  ),
                ),
              ],
            ),
          )
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
    // int id = 1;
    // String v2 = '"idcus":"${id}"';

    String jsondata = '{$v1,$v2}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }

  // Future get_msg() async {
  //   var url = Uri.http(URL(), 'get-msg/${idcus}');
  //   var response = await http.get(url);
  //   var result = json.decode(response.body);
  //   setState(() {
  //     _msg = json.decode(result);
  //   });
  // }
}
