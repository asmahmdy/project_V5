import 'package:flutter/material.dart';
import 'package:myapp/pages/login.dart';
import 'package:myapp/pages/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SharedPreferences? _regisdata;
  SharedPreferences? get regisdata => _regisdata;

  String? username;
  String? email;
  String? name;
  String? lastname;
  String? tell;
  String? address;

  // bool isNotEmpty(String value) => value.isNotEmpty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    _regisdata = await SharedPreferences.getInstance();
    setState(() {
      username = regisdata?.getString('username')!;
      email = regisdata?.getString('email')!;
      name = regisdata?.getString('name')!;
      lastname = regisdata?.getString('lastname')!;
      tell = regisdata?.getString('tell')!;
      address = regisdata?.getString('address')!;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile"),
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
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Username : $username',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Email : $email',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Name : $name',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lastname : $lastname',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tell : $tell',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Address : $address',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 3, 68, 121))),
                  onPressed: () {
                    regisdata?.setBool('Register', true);
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
      ),
    );
  }
}
