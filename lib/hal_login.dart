import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'hal_dashboard.dart';
import 'hal_register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email="";
  String password;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.indigo[300],
            Colors.indigo[100],
            Colors.indigo[100],
            Colors.indigo[200],
          ],
            )
          ),
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //new Image.asset('images/Pekobe_logo.png',width: 100.0,),
             // Text("PEKOBE", style: TextStyle(fontFamily: "courier new", fontSize: 50.0, color: Colors.red[100]),),
             // SizedBox(height: 10.0,),

              TextField(
                style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                decoration: InputDecoration( 

                  border: InputBorder.none,
                            icon: Icon(
                              Icons.account_box,
                              color: Colors.black,
                            ),
                  
                  hintText: 'Masukkan Email',
                  labelText: 'Masukkan Email',
                  ),
                onChanged: (value){
                  setState(() {
                   email = value; 
                  });
                }, 
              
              ),
               Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.black,
                      ),

              TextField(
                obscureText: true,
                style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),

                decoration: InputDecoration(
                  border: InputBorder.none,
                            icon: Icon(
                              Icons.keyboard_hide,
                              color: Colors.black,
                            ),
                  hintText: 'Masukkan password', labelText: 'Masukkan Password', 
                 ),
                onChanged: (value){
                  setState(() {
                   password = value; 
                  });
                },
              ),
              SizedBox(height: 10.0,),
              MaterialButton(
                highlightColor: Colors.transparent,
                child: Padding(
                padding: const EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 42.0),
                child: Text("Masuk", style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),),
                ),
                color: Colors.red[100],
                textColor: Colors.red[800],
                elevation: 7.0,
                onPressed: (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email, password: password).then((FirebaseUser user){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    });
                },
              ),

              SizedBox(height: 10.0,),
              Text("Dont have an account?"),
              SizedBox(height: 10.0,),
                MaterialButton(
                  child: Text("Daftar",style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 20.0,
                            fontFamily: "WorkSansBold"),),
                color: Colors.red[100],
                textColor: Colors.red[800],
                elevation: 7.0,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}