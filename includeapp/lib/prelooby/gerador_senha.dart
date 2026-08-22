import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeradorSenha extends StatefulWidget {
  final String nome;

  const GeradorSenha({super.key, required this.nome});

  @override
  State<GeradorSenha> createState() => _GeradorSenhaState();
}

class _GeradorSenhaState extends State<GeradorSenha> {

  TextEditingController nomeUs = TextEditingController();

  bool mensagem = false;

  Future<void> salvar() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("usuario", nomeUs.text);

  if (!mounted) return;

    String nome = nomeUs.text;

    if (nome.isEmpty){    
      setState(() {
        mensagem = true;
      });  
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => GeradorSenha(nome: nomeUs.text)),
    );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gerador de senha pro usuario'),),
      body: Center(
        child: Column(
          children: [
            Text("Bem-vindo, ${widget.nome}!"),
          ],
        ),
      ),
    );
  }
}