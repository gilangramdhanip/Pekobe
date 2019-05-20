import 'package:flutter/material.dart';
import './hal_about.dart';
import './hal_kuisioner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/crud.dart';
import 'hal_kuisioner.dart';
import 'hal_login.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String nama, alamat, keluhan="";
  crudMedthods crudObj = new crudMedthods();
  var kuisioner;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: new Text(
            "Pendataan Korban bencana", 
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed: (){
            crudObj.getData().then((results){
              setState(() {
               kuisioner = results; 
              });
            });
          },
          )
        ],
       ),
       drawer: new Drawer( //untuk membuat side menu
         child: ListView(
           children: <Widget>[
             new UserAccountsDrawerHeader(
               accountName: new Text(''),
               accountEmail: new Text(''),
               currentAccountPicture: new CircleAvatar(
                 backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
               ),
             ),
             new ListTile(
               title: new Text("About"),
               onTap: (){
                 Navigator.of(context).pop();
                 Navigator.push(context, new MaterialPageRoute(
                   builder: (BuildContext context) => new AboutPage())
                   );
               },
             ),

             new Divider(
               color: Colors.black,
               height: 1.0,
             ),

              new ListTile(
               title: new Text("Kuisioner"),
               onTap: (){
                 Navigator.of(context).pop();
                 Navigator.push(context, new MaterialPageRoute(
                   builder: (BuildContext context) => new KuisionerPage())
                   );
               },
             ),

             new Divider(
               color: Colors.black,
               height: 1.0,
             ),
             
              new ListTile(
               title: new Text("Sign Out"),
               onTap: (){
                 FirebaseAuth.instance.signOut().then((value){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                 });
               },
             ),
           ],
         ),
       ), 
       body: _hasilKuisioner(),
    );
  }

   @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        kuisioner = results;
      });
    });
    super.initState();
  }

  Future<bool> updateDialog(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Data', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 140.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Masukkan Nama'),
                    onChanged: (value) {
                      this.nama = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Masukkan Alamat'),
                    onChanged: (value) {
                      this.alamat = value;
                    },
                  ),

                  TextField(
                    decoration: InputDecoration(hintText: 'Masukkan Keluhan'),
                    onChanged: (value) {
                      this.keluhan = value;
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Update'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj.updateData(selectedDoc, {
                    'nama': this.nama,
                    'alamat': this.alamat
                  }).then((result) {
                    // dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Widget _hasilKuisioner() {
    if (kuisioner != null) {
      return StreamBuilder(
        stream: kuisioner,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (context, i) {
                return new ListTile(
                  leading: Icon(Icons.person),
                  title: Text(snapshot.data.documents[i].data['nama']),
                  subtitle: Text(snapshot.data.documents[i].data['alamat']),
                  
                  onTap: () {
                    updateDialog(
                        context, snapshot.data.documents[i].documentID);
                  },
                  onLongPress: () {
                    crudObj.deleteData(snapshot.data.documents[i].documentID);
                  },
                );
              },
            );
          } 
        },
      );
    } else {
      return Text('Loading, Please wait..');
    }
  }

}




