import 'dart:html';
import 'dart:js_interop';
import 'dart:js_util';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'package:gamestellar/Cursos.dart';

class databasemethods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future Adduserdetails(Map<String, dynamic> userinfomap, String Name) async {
    return await FirebaseFirestore.instance
        .collection("Cursos")
        .doc(Name)
        .set(userinfomap);
  }

  Future DeleteCurso(String Name) async {
    FirebaseFirestore.instance.collection("Cursos").doc(Name).delete();
  }

  Future UpdateCurso(Map<String, dynamic> Name) async {
    FirebaseFirestore.instance
        .collection("Cursos")
        .doc("Ingles Iniciante")
        .update(Name);
  }

  Future<QuerySnapshot> GetinfoAula(String name) async {
    return await FirebaseFirestore.instance
        .collection('Cursos')
        .where("Id", isEqualTo: name)
        .get();
  }

  Future<List<String>> GetDocName() async {
    var snapshot = await FirebaseFirestore.instance.collection('Cursos').get();

    List<String> dataList = [];
    //   for (QueryDocumentSnapshot documentSnapshot in snapshot.docs) {
    for (var doc in snapshot.docs) {
      // 'campo' é o nome do campo cujo valor você quer recuperar do documento
      dataList.add(doc.id);
    }
    return dataList;
  }
}
