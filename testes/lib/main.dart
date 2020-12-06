import 'package:flutter/material.dart';
import 'package:testes/pages/login.page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mytime',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: LoginPage(),
    );
  }
}
