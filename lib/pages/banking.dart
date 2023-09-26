import 'dart:io';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import '../components/buttom_nav_bar.dart';
import '../components/my_api.dart';

class Banking extends StatefulWidget {
  const Banking({super.key});

  @override
  State<Banking> createState() => _BankingState();
}

class _BankingState extends State<Banking> {
  File? image;
  var selectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Banking"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/payment.jpg',
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "SCB",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "หมายเลขบัญชี : 704-294313-5",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "ชื่อ-นามสกุล   :   อัสมะ มะดิเยาะ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                MaterialButton(
                    color: Color.fromARGB(255, 3, 68, 121),
                    child: const Text("Add Payment Slip",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      _imageSlip(ImageSource.gallery);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _imageSlip(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    selectImage = File(image!.path);
    setState(() {
      print(selectImage);
      uploadSlip();
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: const Text('Successfully'),
            content: const Text('ชำระเงินเรียบร้อยแล้ว :)'),
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
    });
  }

  Future uploadSlip() async {
    final request =
        http.MultipartRequest('POST', Uri.parse("http://${URL()}/post-slip"));
    final headers = {"Content-type": "application/json"};
    request.fields['idfix'] = '1';
    request.files.add(
      http.MultipartFile('imgslip', selectImage!.readAsBytes().asStream(),
          selectImage!.lengthSync(),
          filename: selectImage!.path.split("/").last),
    );
    request.headers.addAll(headers);
    final response = await request.send();
    print(response);
  }
}
