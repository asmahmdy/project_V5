import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:myapp/components/my_text_field.dart';
import 'package:myapp/pages/status.dart';
import '../components/my_api.dart';

class FixerC extends StatefulWidget {
  final String ndevice, brand, problem, date, time, detail, process;
  const FixerC(
      {super.key,
      required this.ndevice,
      required this.brand,
      required this.problem,
      required this.date,
      required this.time,
      required this.detail,
      required this.process});

  @override
  State<FixerC> createState() => _FixerCState();
}

class _FixerCState extends State<FixerC> {
  var ndevice, brand, problem, date, time, detail, process;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ndevice = widget.ndevice;
    brand = widget.brand;
    problem = widget.problem;
    date = widget.date;
    time = widget.time;
    detail = widget.detail;
    process = widget.process;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fixer Confirm"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name Device : ${ndevice}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Brand : ${brand}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Problem : ${problem}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Date : ${date}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Time : ${time}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Detail : ${detail}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 3, 68, 121)),
                  ),
                  onPressed: () {
                    postFixer();
                    setState(() {});
                  },
                  child: const Text('Confirm'),
                ),
              ),
            ]),
      ),
    );
  }

  Future postFixer() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'post-fixer');
    Map<String, String> header = {"Content-type": "application/json"};
    // int user = 26;

    String f0 = '"idctm" : "${idcus()}"';
    String f1 = '"ndevice":"${ndevice}"';
    String f2 = '"brand":"${brand}"';
    String f3 = '"problem":"${problem}"';
    String f4 = '"date":"${date}"';
    String f5 = '"time":"${time}"';
    String f6 = '"detail":"${detail}"';

    String jsondata = '{$f0,$f1,$f2,$f3,$f4,$f5,$f6}';
    print(jsondata);
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
    var data = json.decode(response.body);
    print(data['id']);
    int id = data['id'];
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StatusFixer(id: id)));
    });
  }
}
