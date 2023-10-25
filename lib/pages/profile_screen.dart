import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/pages/login.dart';
import 'package:myapp/pages/profile_edit.dart';
import 'package:myapp/pages/side_menu.dart';

import 'dart:async';

import 'package:http/http.dart' as http;

import '../components/my_api.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List _profile = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();

    // initial();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile Detail"),
          backgroundColor: Color.fromRGBO(11, 74, 126, 1),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NavDrawer()));
                  },
                  child: Icon(
                    Icons.menu,
                    size: 26.0,
                  ),
                )),
          ]),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 52, 52, 53),
                  size: 120.0,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 250,
                      decoration: ShapeDecoration(
                          color: Color.fromARGB(255, 233, 234, 235),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          itemCount: _profile.length,
                          itemBuilder: (context, index) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Username : ${_profile[index]['username']}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Email : ${_profile[index]['email']}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Name : ${_profile[index]['name']}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Lastname : ${_profile[index]['lastname']}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Tell : ${_profile[index]['tell']}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Address : ${_profile[index]['address']}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        getProfile();

                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => ProfileEdit(),
                            ));
                      },
                      child: Text('Edit')),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color.fromARGB(255, 3, 68, 121))),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => Logins(),
                            ));
                      },
                      child: Text('LogOut')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future getProfile() async {
    var url = Uri.http(URL(), 'get-profile/${idcus()}');
    var response = await http.get(url);
    var result = utf8.decode(response.bodyBytes);
    setState(() {
      _profile = json.decode(result);
      print(_profile);
    });
  }
}
