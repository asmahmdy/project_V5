import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/banking.dart';
import '../components/my_api.dart';

// ignore: must_be_immutable
class StatusFixer extends StatefulWidget {
  int id;
  StatusFixer({super.key, required this.id});

  @override
  State<StatusFixer> createState() => _StatusFixerState();
}

class _StatusFixerState extends State<StatusFixer> {
  List _process = [];
  var _idfix;
  // var rev;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _idfix = widget.id;
    print(_idfix);
    get_fixer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Status"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _process.isNotEmpty
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 30, bottom: 100),
                    child: Text(
                      'Process  : ${_process[0]['process']}',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
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
                          MaterialPageRoute(builder: (context) => Banking())),
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
        ),
      ),
    );
  }

  Future get_fixer() async {
    var url = Uri.http(URL(), 'get-fixer/${_idfix}');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    setState(() {
      _process = json.decode(result);
    });
  }
}
