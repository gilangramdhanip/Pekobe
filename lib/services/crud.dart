import 'dart:async';
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class crudMedthods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }
 
  Future<void> tambahData(dataKuisioner) async {
    if (isLoggedIn()) {
      Firestore.instance.collection('kuisioner').add(dataKuisioner).catchError((e) {
         print(e);
       });
    } else {
      print('You need to be logged in');
    }
  }

    getData() async {
    return await Firestore.instance.collection('kuisioner').snapshots();
  }

    updateData(selectedDoc, newValues) {
    Firestore.instance
        .collection('kuisioner')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }

  deleteData(docId) {
    Firestore.instance
        .collection('kuisioner')
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

}