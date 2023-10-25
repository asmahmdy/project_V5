// ignore_for_file: use_function_type_syntax_for_parameters

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myapp/components/buttom_nav_bar.dart';
import 'package:myapp/components/my_api.dart';
import 'package:myapp/pages/register.dart';

class Logins extends StatefulWidget {
  const Logins({super.key});

  @override
  State<Logins> createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  int id_cus = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: (Colors.white),
      body: ListView(
        children: [
          Container(child: Image.asset('assets/images/logo.png')),
          Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Wellcome to Mr.Fixer",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 10),
                      //password
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                          }
                          return null; // No error
                        },
                        decoration: InputDecoration(
                            labelText: 'Email', border: OutlineInputBorder()),
                      ),

                      const SizedBox(height: 10),
                      //confirm password
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                          }
                          return null; // No error
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder()),
                      ),

                      const SizedBox(height: 25),

                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Color.fromARGB(223, 6, 133, 236))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Registers()),
                                );
                              },
                              child: const Text('Back'),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Color.fromARGB(255, 3, 68, 121))),
                              onPressed: () {
                                _formKey.currentState!.validate();
                                postLogin();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => buttomBar()),
                                // );
                              },
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ),
                    ]),
              )),
        ],
      ),
    );
  }

  Future postLogin() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'login');

    Map<String, String> header = {"Content-type": "application/json"};

    String v2 = '"email":"${emailController.text}"';
    String v3 = '"password":"${passwordController.text}"';
    String jsondata = '{$v2,$v3}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);

    var resulttext = utf8.decode(response.bodyBytes);
    var result_json = json.decode(resulttext);

    String status = result_json['status'];
    id_cus = result_json['id'];
    print(status);
    print(id_cus);
    if (status == 'Successful') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => buttomBar()),
      );
    } else if (status == 'Unsuccess') {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: const Text('Unsuccess'),
            content: const Text('Log in ไม่สำเร็จโปรดลองอีกครั้ง'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ]),
      );
    }
  }
}
