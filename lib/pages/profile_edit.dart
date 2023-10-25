import 'package:flutter/material.dart';

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:myapp/pages/profile_screen.dart';
import '../components/my_api.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _lastname = TextEditingController();
  final _tell = TextEditingController();
  final _address = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
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
                    controller: _username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Username : "),
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
                    controller: _email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Email : "),
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
                    controller: _password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Password : "),
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
                    controller: _name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Name : "),
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
                    controller: _lastname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Lastname : "),
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
                    controller: _tell,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Tell : "),
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
                    controller: _address,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Address : "),
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
                        updateprofile();
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                              title: const Text('Edit Data Profile'),
                              content: const Text('แก้ไขเรียบร้อยแล้ว'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProfileScreen();
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

  Future updateprofile() async {
    var url = Uri.http(URL(), 'update-profile/${idcus()}');
    Map<String, String> header = {"Content-type": "application/json"};

    String f1 = '"username":"${_username.text}"';
    String f2 = '"email":"${_email.text}"';
    String f3 = '"password":"${_password.text}"';
    String f4 = '"name":"${_name.text}"';
    String f5 = '"lastname":"${_lastname.text}"';
    String f6 = '"tell":"${_tell.text}"';
    String f7 = '"address":"${_address.text}"';
    String jsondata = '{$f1,$f2,$f3,$f4,$f5,$f6,$f7}';
    var response = await http.put(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}
