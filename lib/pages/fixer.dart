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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mr.Fixer"),
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
                      // Form is valid, navigate to the next screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FixerC(
                          ndevice: _ndevice.text,
                          brand: _brand.text,
                          problem: _problem.text,
                          date: _date.text,
                          time: _time.text,
                          detail: _detail.text,
                          process: _process.text,
                        ),
                      ));
                    }
                  },
                  child: Text('Next'),
                )

                // ElevatedButton(
                //     style: const ButtonStyle(
                //       backgroundColor: MaterialStatePropertyAll<Color>(
                //           Color.fromARGB(255, 3, 68, 121)),
                //     ),
                //     onPressed: () {
                //       _formKey.currentState!.validate();
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => FixerC(
                //                 ndevice: _ndevice.text,
                //                 brand: _brand.text,
                //                 problem: _problem.text,
                //                 date: _date.text,
                //                 time: _time.text,
                //                 detail: _detail.text,
                //                 process: _process.text,
                //               )));
                //     },
                //     child: Text("Send"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
