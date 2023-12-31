import 'package:flutter/material.dart';
import 'dart:async';

import 'package:http/http.dart' as http;
import '../components/buttom_nav_bar.dart';
import '../components/my_api.dart';

class EditFix extends StatefulWidget {
  final id;
  const EditFix({super.key, required this.id});

  @override
  State<EditFix> createState() => _EditFixState();
}

class _EditFixState extends State<EditFix> {
  final _ndevice = TextEditingController();
  final _brand = TextEditingController();
  final _problem = TextEditingController();
  final _date = TextEditingController();
  final _time = TextEditingController();
  final _detail = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var ed1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ed1 = widget.id;
    print(ed1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(25),
                  child: TextFormField(
                    controller: _ndevice,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Name Device : "),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: TextFormField(
                    controller: _brand,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Brand : "),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: TextFormField(
                    controller: _problem,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Problem : "),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: TextFormField(
                    controller: _date,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Date : ว/ด/ป"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: TextFormField(
                    controller: _time,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Time : "),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: TextFormField(
                    maxLines: 3,
                    controller: _detail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Detail : "),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                  ),
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 3, 68, 121)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        updatefix();
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                              title: const Text('Edit Data Fix'),
                              content: const Text('แก้ไขเรียบร้อยแล้ว'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return buttomBar();
                                      },
                                    ),
                                  ),
                                  child: const Text('OK'),
                                ),
                              ]),
                        );
                      }
                    },
                    child: Text("Send"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future updatefix() async {
    var url = Uri.http(URL(), 'update-fix/${ed1}');
    Map<String, String> header = {"Content-type": "application/json"};

    String f1 = '"ndevice":"${_ndevice.text}"';
    String f2 = '"brand":"${_brand.text}"';
    String f3 = '"problem":"${_problem.text}"';
    String f4 = '"date":"${_date.text}"';
    String f5 = '"time":"${_time.text}"';
    String f6 = '"detail":"${_detail.text}"';
    String jsondata = '{$f1,$f2,$f3,$f4,$f5,$f6}';
    var response = await http.put(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}
