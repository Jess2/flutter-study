import 'package:flutter/material.dart';
import 'src/signIn.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
    );
  }
}