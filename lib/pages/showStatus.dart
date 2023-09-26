import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../components/my_api.dart';
import 'banking.dart';

// ignore: must_be_immutable
class ShowStatus extends StatefulWidget {
  ShowStatus({
    super.key,
  });

  @override
  State<ShowStatus> createState() => _ShowStatusState();
}

class _ShowStatusState extends State<ShowStatus> {
  List _process = [];

  // var rev;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_fixer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Status"),
          backgroundColor: Color.fromRGBO(11, 74, 126, 1),
        ),
        body: ListView.builder(
          itemCount: _process.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 60, left: 30, bottom: 100),
                  child: Text(
                    'Status : ${_process[index]['process']}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(Colors.blue)),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Banking())),
                          icon: Icon(
                            Icons.payment,
                            color: Colors.white,
                          ),
                          label: Text("ชำระเงิน"),
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 3, 68, 121))),
                          onPressed: get_fixer,
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                          label: Text("Refresh"),
                        ),
                      ]),
                ),
              ],
            );
          },
        ));
  }

  Future get_fixer() async {
    var url = Uri.http(URL(), 'get-status/${idcus()}');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    setState(() {
      _process = json.decode(result);
      print(_process);
    });
  }
}
