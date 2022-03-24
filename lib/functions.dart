import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Functions {
  Future<bool> RegisterUser(
      String email, String password, String name, String mobile) async {
    if (email == "" || password == "" || name == "" || mobile.length != 10) {
      return false;
    }
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference user = firestore.collection('user');
      await user.add({'email': email, 'name': name, 'mobile': mobile});
      return true;
    } on Exception catch (e) {}
    return false;
  }

  Future<bool> SignUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<String>> getCred(String email) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user = firestore.collection('user');
    List<String> ans = [];
    await user
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        ans.add(element['name']);
        ans.add(element['mobile']);
      });
    });
    return ans;
  }
}
