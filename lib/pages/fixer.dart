import 'package:flutter/material.dart';
import 'package:myapp/pages/fixer_confirm.dart';

class FixerPage extends StatefulWidget {
  const FixerPage({super.key});

  @override
  State<FixerPage> createState() => _FixerPageState();
}

class _FixerPageState extends State<FixerPage> {
  final _ndevice = TextEditingController();
  final _brand = TextEditingController();
  final _problem = TextEditingController();
  final _date = TextEditingController();
  final _time = TextEditingController();
  final _detail = TextEditingController();
  final _process = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mr.Fixer"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(25),
                child: TextField(
                  controller: _ndevice,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name Device : "),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: TextField(
                  controller: _brand,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Brand : "),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: TextField(
                  controller: _problem,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Problem : "),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: TextField(
                  controller: _date,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Date : ว/ด/ป"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: TextField(
                  controller: _time,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Time : "),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: TextField(
                  maxLines: 3,
                  controller: _detail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Detail : "),
                ),
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 3, 68, 121)),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FixerC(
                              ndevice: _ndevice.text,
                              brand: _brand.text,
                              problem: _problem.text,
                              date: _date.text,
                              time: _time.text,
                              detail: _detail.text,
                              process: _process.text,
                            )));
                  },
                  child: Text("Send"))
            ],
          ),
        ),
      ),
    );
  }
}
