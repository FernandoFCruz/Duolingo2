import 'dart:async';
//import 'dart:ffi';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamestellar/firebase_options.dart';
import 'package:gamestellar/main.dart';
import 'Cursos.dart';
import 'Database.dart';
import 'Register.dart';

String? Conteudo, name, Number, NomeCurso;
int Contador = 0;
List<String> CursosAux = ['item1', 'item2', 'item3'];

GetDocName() async {
  List? Cursos = await databasemethods().GetDocName();
  Contador = 0;
  // CursosAux = [];
  Cursos.forEach((element) {
    Contador += 1;
    CursosAux[Contador] = element;
  });
  print(Contador);
}

class MinhaTela extends StatefulWidget {
  @override
  _MinhaTelaState createState() => _MinhaTelaState();
}

class _MinhaTelaState extends State<MinhaTela> {
  @override
  void initState() {
    super.initState();
    minhaFuncao();
  }

  minhaFuncao() {
    GetDocName();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
//          title: const Text('Minha AppBar'),
          actions: [
            TextButtonTheme(
              data: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          NoticiaDetalhada(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Text('Man. Cursos'),
              ),
            ),
            TextButtonTheme(
              data: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text('Meus Cursos'),
              ),
            ),
            TextButtonTheme(
              data: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          CursoScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Text('Todos os Cursos'),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Container(
              child: ListView.builder(
                itemCount: Contador,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => NoticiaDetalhada()));
                    },
                    leading: Icon(Icons.book),
                    title: Text(CursosAux[index + 1].toString()),
//                    subtitle: Text('Descrição do item $index'),
                    trailing: Text('%0'),
                  );
                },
              ),
            ),
            Container(
              child: const Center(
                child: Text(''),
              ),
            ),
            Container(
              child: const Center(
                child: Text(''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
