import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool ehExibirSenha = false;
  bool boolInativarEmailNotifications = false;
  bool boolInativarPhoneNotifications = false;
  String stringSelecionarGenero = '';
  double doubleFontSize = 12.0;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController nascimentoController = TextEditingController();
  final TextEditingController celularController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    nascimentoController.dispose();
    celularController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  void registrar() async {
    final String nome = nomeController.text.trim();
    final String nascimento = nascimentoController.text.trim();
    final String celular = celularController.text.trim();
    final String email = emailController.text.trim();
    final String senha = senhaController.text.trim();

    // Save registration data using SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nome);
    await prefs.setString('nascimento', nascimento);
    await prefs.setString('phone', celular);
    await prefs.setString('email', email);
    await prefs.setString('senha', senha);
    Navigator.pushNamed(context, '/');
  }


  void toggleSenha() {
    setState(() {
      ehExibirSenha = !ehExibirSenha;
    });
  }

  void editarGenero(String value) {
    setState(() {
      stringSelecionarGenero = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
              maxLength: 50,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: nascimentoController,
              decoration: const InputDecoration(labelText: 'Data de nascimento'),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: celularController,
              decoration: const InputDecoration(labelText: 'Celular'),
              maxLength: 10,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
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
                  onPressed: toggleSenha,
                ),
              ),
              obscureText: !ehExibirSenha,
            ),
            const SizedBox(height: 16.0),
            CheckboxListTile(
              title: const Text('Masculino'),
              value: stringSelecionarGenero == 'Masculino',
              onChanged: (value) => editarGenero('Masculino'),
            ),
            CheckboxListTile(
              title: const Text('Feminino'),
              value: stringSelecionarGenero == 'Feminino',
              onChanged: (value) => editarGenero('Feminino'),
            ),
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Habilitar notificacoes do email'),
              value: boolInativarEmailNotifications,
              onChanged: (value) {
                setState(() {
                  boolInativarEmailNotifications = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Habilitar notificacoes do telefone'),
              value: boolInativarPhoneNotifications,
              onChanged: (value) {
                setState(() {
                  boolInativarPhoneNotifications = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Slider(
              value: doubleFontSize,
              min: 5.0,
              max: 30.0,
              divisions: 7,
              label: doubleFontSize.round().toString(),
              onChanged: (value) {
                setState(() {
                  doubleFontSize = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              style: TextStyle(fontSize: doubleFontSize),
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Fonte variável',
                labelStyle: TextStyle(fontSize: doubleFontSize),
              ),
              maxLength: 50,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                registrar();
                // Perform registration logic here
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
