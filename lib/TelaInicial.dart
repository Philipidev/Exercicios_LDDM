import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  final String? usuario;

  const TelaInicial({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vindo'),
      ),
      body: Center(
        child: Text('Bem vindo, $usuario!'),
      ),
    );
  }
}