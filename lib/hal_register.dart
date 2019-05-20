import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/usermanagement.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Register"),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'email', labelText: 'Masukkan Email'),
                onChanged: (value){
                  setState(() {
                   email = value; 
                  });
                },
              ),

              TextField(
                decoration: InputDecoration(hintText: 'password', labelText: 'Masukkan Password'),
                onChanged: (value){
                  setState(() {
                   password = value; 
                  });
                },
              ),
              SizedBox(height: 10.0,),
              
              MaterialButton(
                child: new Text("Daftar"),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email, password: password).then((signedInUser) {
                  UserManagement().storeNewUser(signedInUser, context);
                  }).catchError((e) {
                 print(e);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}