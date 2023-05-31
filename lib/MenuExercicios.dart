import 'package:flutter/material.dart';

import 'Exemplo1.dart';
import 'ListaItens.dart';
import 'MinhaConta.dart';

class MenuExerciciosState extends StatefulWidget {
  const MenuExerciciosState({super.key});
  @override
  // ignore: library_private_types_in_public_api
  MenuExercicios createState() =>
      MenuExercicios();
}

class MenuExercicios extends State<MenuExerciciosState> {
  int currIndice = 0;

  Widget ObterPagina(int i) {
    switch (i) {
      case 0:
        return const Exemplo1();
      case 1:
        return ListaItens();
      case 2:
        return const Exemplo2();
      default:
        return throw Exception("error item inválido");
    }
  }

  void selecionarIndice(int value) {
    setState(() {
      currIndice = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: ObterPagina(currIndice),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Exemplos 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Exemplo 2',
          ),
        ],
        currentIndex: currIndice,
        onTap: selecionarIndice,
      ),
    );
  }
}



