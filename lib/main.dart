
import 'package:flutter/material.dart';

import 'Cadastro.dart';
import 'Login.dart';
import 'MenuExercicios.dart';
import 'ListaItens.dart';


void main() async {
  runApp(const ExerciciosApp());
}



class ExerciciosApp extends StatelessWidget {
  const ExerciciosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de exercicios',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        visualDensity: VisualDensity.compact,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/exercicio1': (context) => const Cadastro(),
        '/exercicio2': (context) => Login(),
        '/exercicio3': (context) => const MenuExerciciosState(),
        '/exercicio4': (context) => ListaItens(),

        // Add more routes for other exercises
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Exercicios'),
        ),

        body:
        Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("tecnology.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/exercicio1');
                    },
                    child: const Text('Exercício de cadastro'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(400, 40), //////// HERE
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/exercicio2');
                    },
                    child: const Text('Exercício de Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(400, 40), //////// HERE
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/exercicio3');
                    },
                    child: const Text('Exercício Menu de navegacao'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(400, 40), //////// HERE
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/exercicio4');
                    },
                    child: const Text('Exercício lista de itens'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(400, 40), //////// HERE
                    ),
                  ),
                  // Add more buttons for other exercises
                ],
              ),
            )
        )

    );
  }
}