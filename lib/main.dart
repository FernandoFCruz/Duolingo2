import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamestellar/firebase_options.dart';
import 'package:gamestellar/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
