import 'package:flutter/material.dart';
import 'package:myapp/pages/fixer.dart';

class FixDetail extends StatefulWidget {
  const FixDetail({super.key});

  @override
  State<FixDetail> createState() => _FixDetailState();
}

class _FixDetailState extends State<FixDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Mr.Fixer"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 55, top: 80),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 500,
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 233, 234, 235),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Column(
                children: [
                  Image(image: AssetImage('assets/images/detail.png')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "การแจ้งซ่อมคิดราคาตามอุปกรณ์ และ คิดค่าบริการซ่อมเพิ่มเติม ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "- ซ่อมขั้นธรรมดา คิดราคาเป็น 200 บาท\n - ซ่อมขั้นปางกลาง คิดราคาเป็น 500 บาท\n - ซ่อมขั้นยาก คิดราคาเป็น 1000 บาท"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 3, 68, 121)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FixerPage()));
                },
                child: Text("Ok"))
          ],
        ),
      ),
    );
  }
}
