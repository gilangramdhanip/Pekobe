import 'package:flutter/material.dart';
import 'splash.dart';

//pages
import 'hal_login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: SepelasScreen(), debugShowCheckedModeBanner: false,
    );
  }
}