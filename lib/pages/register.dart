import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/login.dart';

import '../components/my_api.dart';

class Registers extends StatefulWidget {
  const Registers({super.key});

  @override
  State<Registers> createState() => _RegistersState();
}

class _RegistersState extends State<Registers> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final tellController = TextEditingController();
  final addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // var _username, _email, _name, _lastname, _tell, _address;
  // late SharedPreferences regisdata;
  // late bool newcus;

  @override
  void initState() {
    super.initState();
    // check_if_already_register();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Register'),
      // ),
      backgroundColor: (Colors.white),
      body: ListView(
        children: [
          Container(child: Image.asset('assets/images/logo.png')),
          Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Let's create an account for you!",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                    decoration: InputDecoration(
                        labelText: 'Username', border: OutlineInputBorder()),
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
                        labelText: 'Password', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "----Fill in your personal information----",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                    decoration: InputDecoration(
                        labelText: 'Name', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: lastnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                    decoration: InputDecoration(
                        labelText: 'Lastname', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: tellController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                    decoration: InputDecoration(
                        labelText: 'Tell', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล'; // Error message if data is empty
                      }
                      return null; // No error
                    },
                    decoration: InputDecoration(
                        labelText: 'Address', border: OutlineInputBorder()),
                  ),

                  const SizedBox(height: 25),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color.fromARGB(255, 3, 68, 121))),
                      onPressed: () {
                        _formKey.currentState!.validate();
                        // String username = usernameController.text;
                        // String password = passwordController.text;
                        // String email = emailController.text;
                        // String name = nameController.text;
                        // String lastname = lastnameController.text;
                        // String tell = tellController.text;
                        // String address = addressController.text;

                        // if (name != '' && password != '') {
                        //   print('Successful');
                        //   regisdata.setBool('Register', false);
                        //   regisdata.setString('username', username);
                        //   regisdata.setString('email', email);
                        //   regisdata.setString('name', name);
                        //   regisdata.setString('lastname', lastname);
                        //   regisdata.setString('tell', tell);
                        //   regisdata.setString('address', address);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Logins(),
                            ));
                        // }
                        postTodo();
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // void check_if_already_register() async {
  //   regisdata = await SharedPreferences.getInstance();
  //   newcus = (regisdata.getBool('Register') ?? true);

  //   print(newcus);
  //   if (newcus == false) {
  //     Navigator.pushReplacement(
  //         context,
  //         new MaterialPageRoute(
  //             builder: (context) => ProfileScreen(
  //                   Username: '${_username}',
  //                   Email: '$_email',
  //                   Name: '$_name',
  //                   Lastname: '$_lastname',
  //                   Tell: '$_tell',
  //                   Address: '$_address',
  //                 )));
  //   }
  // }

  Future postTodo() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'register');
    Map<String, String> header = {"Content-type": "application/json"};
    String v1 = '"username":"${usernameController.text}"';
    String v2 = '"email":"${emailController.text}"';
    String v3 = '"password":"${passwordController.text}"';
    String v4 = '"name":"${nameController.text}"';
    String v5 = '"lastname":"${lastnameController.text}"';
    String v6 = '"tell":"${tellController.text}"';
    String v7 = '"address":"${addressController.text}"';
    String jsondata = '{$v1,$v2,$v3,$v4,$v5,$v6,$v7}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}
