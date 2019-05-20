import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'hal_login.dart';

class SepelasScreen extends StatefulWidget {
  @override
  _SepelasScreenState createState() => _SepelasScreenState();
}

class _SepelasScreenState extends State<SepelasScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      
      seconds: 5,
      navigateAfterSeconds: LoginPage(),
      image: Image.asset("images/Pekobe_logo.png"),
      backgroundColor: Colors.white,
      photoSize: 100,
      loaderColor: Colors.blue[100],
      loadingText: Text("Harap Menunggu"),
    );
    

  }
}