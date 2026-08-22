import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:includeapp/inicial.dart';


class LoginTeste extends StatefulWidget {
  const LoginTeste({super.key});

  @override
  State<LoginTeste> createState() => _LoginTesteState();
}

  final TextEditingController nome = TextEditingController();
  final TextEditingController email = TextEditingController();

 Future<void> gravardadosDados(String nome, String email) async {
    final db = FirebaseFirestore.instance;
    final pessoa = <String, dynamic>{
      "nome": nome,
      "email": email,
    };
    final doc = await db.collection("pessoas").add(pessoa);
  }

  void limparCampos() {
    nome.clear();
    email.clear();
  }

class _LoginTesteState extends State<LoginTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Login Teste'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: nome,
                decoration: const InputDecoration(label: Text("Nome")),
              ),
              TextField(
                controller: email,
                decoration: const InputDecoration(label: Text("Email")),
              ),
              ElevatedButton(
                onPressed: () {
                  gravardadosDados(
                    nome.text,
                    email.text
                  );
                  limparCampos();
                },
                child:const Text("Gravar dados"),
              ),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Inicial()));
              }, child: const Text("Listar dados")),
            ],
          ),
        ),
      ),
    );
  }
}