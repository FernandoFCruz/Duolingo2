import 'package:flutter/material.dart';
import 'package:gamestellar/login.dart';
import 'package:gamestellar/tela.dart';
import 'app.dart';

void main() {
  runApp(MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'GameStellar',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      

    );
  }
}
