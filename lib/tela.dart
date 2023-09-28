
import 'package:flutter/material.dart';
import 'app.dart';
class TelaPage extends StatefulWidget {
  const TelaPage({Key? key});

  @override
  _TelaPageState createState() => _TelaPageState();
}

class _TelaPageState extends State<TelaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 205, 32),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/bene.png'
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 74, 31, 255)
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 50,
                    maxWidth: 280,
                  ),
                  
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Congratulations ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight:FontWeight.bold,
                        )
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 3.0,color: Colors.white),
                  backgroundColor: Color.fromARGB(255, 255, 205, 32),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 50,
                    maxWidth: 280,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Parabéns ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight:FontWeight.bold,
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    
    )
    ;
  }
}