// ignore_for_file: unused_importimport 'dart:ffi';

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamestellar/firebase_options.dart';
import 'package:gamestellar/login.dart';
import 'package:gamestellar/register.dart';
import 'Home2.dart';
import 'Database.dart';

String Pergunta = '', Resposta = '', Opcoes = '';

GetDocName() async {
  List? Cursos = await databasemethods().GetDocName();
  Contador = 0;
  // CursosAux = [];
  Cursos.forEach((element) {
    Contador += 1;
    CursosAux[Contador] = element;
  });
}

GetCursosInfo(String name) async {
  QuerySnapshot querySnapshot = await databasemethods().GetinfoAula('5');

  Pergunta = "${querySnapshot.docs[0]["Pergunta1"]}";
  Resposta = "${querySnapshot.docs[0]["Resposta1"]}";
  Opcoes = "${querySnapshot.docs[0]["opcoes1"]}";
}

Adduserdetails(String Name) async {
  Map<String, dynamic> userinfomap = {
    "Id": Name,
    "Pergunta1": "Pergunta5",
    "Resposta1": "Resposta5",
    "opcoes1": "opcoes5",
  };
  databasemethods().Adduserdetails(userinfomap, Name);
}

DeleteCurso(String name) async {
  databasemethods().DeleteCurso(name);
}

UpdateCurso(Map<String, dynamic> update) async {
  databasemethods().UpdateCurso(update);
}

class NoticiaDetalhada extends StatefulWidget {
  @override
  _NoticiaDetalhadaState createState() => _NoticiaDetalhadaState();
}

class _NoticiaDetalhadaState extends State<NoticiaDetalhada> {
  @override
  void initState() {
    super.initState();
    minhaFuncao();
  }

  minhaFuncao() {
    GetCursosInfo('Ingles Iniciante');
  }

  TextEditingController myController1 = new TextEditingController();
  TextEditingController myController2 = new TextEditingController();
  TextEditingController myController3 = new TextEditingController();
  TextEditingController myController4 = new TextEditingController();

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          TextField(
            controller: myController1,
            decoration: InputDecoration(hintText: Pergunta),
          ),
          TextField(
            controller: myController4,
            decoration: InputDecoration(hintText: Resposta),
          ),
          TextButton(
            child: Text('Update'),
            onPressed: () {
              String RespostaAux, PerguntaAux;
              if (myController1 != Pergunta) {
                PerguntaAux = myController1.text;
              } else {
                PerguntaAux = Pergunta;
              }
              if (myController4 != Resposta) {
                RespostaAux = myController4.text;
              } else {
                RespostaAux = Resposta;
              }

              Map<String, dynamic> Uptade = {
                "Id": "5",
                "Pergunta1": PerguntaAux,
                "Resposta1": RespostaAux,
                "opcoes1": "opcoes5",
              };
              UpdateCurso(Uptade);
            },
          ),
          TextField(
            controller: myController2,
            decoration:
                InputDecoration(hintText: 'Digite o nome do Curso a Deletar'),
          ),
          TextButton(
            child: Text('Delete'),
            onPressed: () {
              DeleteCurso(myController2.text);
            },
          ),
          TextField(
            controller: myController3,
            decoration:
                InputDecoration(hintText: 'Digite o nome do Curso a Criar'),
          ),
          TextButton(
            child: Text('Create'),
            onPressed: () {
              Adduserdetails(myController3.text);
            },
          ),
        ],
      ),
    );
  }
}
