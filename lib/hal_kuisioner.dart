import 'package:flutter/material.dart';
import 'services/crud.dart';


class KuisionerPage extends StatefulWidget {
  @override
  _KuisionerPageState createState() => _KuisionerPageState();
}

class _KuisionerPageState extends State<KuisionerPage> {
  String nama, alamat, keluhan="";
  bool checked = false;


  crudMedthods crudObj = new crudMedthods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Halaman Kuisioner"
        ),
      ),

      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(hintText: "Masukkan Nama"),
              onChanged: (String textinput){
                setState(() {
                  this.nama = textinput;
                });
              }
            ),

            TextField(
              decoration: InputDecoration(hintText: "Masukkan Keluhan"),
              onChanged: (String textinput){
                setState(() {
                 this.keluhan = textinput; 
                });
              },
            ),

            TextField(
              decoration: InputDecoration(hintText: "Masukkan Alamat"),
              onChanged: (String textinput){
                setState(() {
                  this.alamat = textinput;
                });
              },
            ),
            
            MaterialButton(
              child: Text("Kirim"),
              onPressed: (){
                Navigator.of(context).pop();
                crudObj.tambahData({
                  'nama': this.nama,
                  'keluhan': this.keluhan,
                  'alamat': this.alamat,
                  });
              },
            )
          ],
        ),
      ),
    );
  }
}