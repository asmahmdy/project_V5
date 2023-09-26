import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/edit_fix.dart';
import '../components/my_api.dart';

class HistoryFix extends StatefulWidget {
  const HistoryFix({
    super.key,
  });

  @override
  State<HistoryFix> createState() => _HistoryFixState();
}

class _HistoryFixState extends State<HistoryFix> {
  List _historyFix = [];
  void initState() {
    // TODO: implement initState
    super.initState();

    get_hisfixer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Fix'),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 30),
          child: ListView.builder(
              itemCount: _historyFix.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name Device : ${_historyFix[index]['ndevice']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Brand : ${_historyFix[index]['brand']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Problem : ${_historyFix[index]['problem']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Time : ${_historyFix[index]['time']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Detail : ${_historyFix[index]['detail']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color.fromARGB(255, 3, 68, 121)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditFix(
                                    id: _historyFix[index]['id'],
                                  )));
                          setState(() {});
                        },
                        child: const Text('Edit'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
              })),
    );
  }

  Future get_hisfixer() async {
    var url = Uri.http(URL(), 'get-hisfix/${idcus()}/');
    var response = await http.get(url);
    var result = utf8.decode(response.bodyBytes);
    setState(() {
      _historyFix = json.decode(result);
      print(_historyFix);
    });
  }
}
