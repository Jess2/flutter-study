import 'package:flutter/material.dart';
import 'src/random_list.dart';
import 'src/login.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}