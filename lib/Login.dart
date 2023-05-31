import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MenuExercicios.dart';
import 'cadastro.dart';


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState  extends State<Login>{
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool ehExibirSenha = false;

  void _login() {
    final String email = loginController.text.trim();
    final String senha = senhaController.text.trim();

    if (email == 'admin' && senha == '123') {
      const AlertDialog(content:Text('Sucesso'));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalido'),
            content: const Text('Usuario ou senha invalidos'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  void logar() async {
    final String email = loginController.text.trim();
    final String senha = senhaController.text.trim();

    // Read registration data from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? emailRegistrado = prefs.getString('email');
    final String? senhaRegistrada = prefs.getString('senha');

    if (email == emailRegistrado && senha == senhaRegistrada) {
      // Credentials are correct, navigate to welcome screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuExerciciosState(),
        ),
      );
    } else {
      // Credentials are incorrect, display an AlertDialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalido'),
            content: Text('Usuario ou senha incorreto'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void exibirEsconderSenha() {
    setState(() {
      ehExibirSenha = !ehExibirSenha;
    });
  }

  void goToCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const Cadastro();
        },
      ),
    );
  }

  @override
  void dispose() {
    loginController.dispose();
    senhaController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body:
      Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 16.0),

            TextFormField(
              controller: loginController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: senhaController,
              decoration: InputDecoration(
                labelText: 'Senha',
                suffixIcon: IconButton(
                  icon: Icon(
                    ehExibirSenha ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: exibirEsconderSenha,
                ),
              ),
              obscureText: !ehExibirSenha,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                logar();
                // Perform registration logic here
              },
              child: const Text('LOGIN'),
            ),
            GestureDetector(
              onTap: goToCadastro,
              child: const Text(
                  "Nao tem conta?", style:TextStyle(color: Colors.red)
              ),
            ),
          ],
        ),
      ),
    );
  }
}