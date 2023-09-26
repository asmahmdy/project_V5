import 'package:flutter/material.dart';

import 'package:myapp/pages/login.dart';
import 'package:myapp/pages/message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ChatPage());
  }
}
