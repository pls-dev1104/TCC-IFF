import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class LoginTeste extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginTeste> createState() => _LoginTesteState();
}

class _LoginTesteState extends State<LoginTeste> {

  final TextEditingController nome = TextEditingController();
  final TextEditingController email = TextEditingController();


  @override
  void dispose() {
    nome.dispose();
    email.dispose();
    super.dispose();
  }

 Future<void> gravardadosDados(String nome, String email) async {
    final db = FirebaseFirestore.instance;
    final pessoa = <String, dynamic>{
      "nome": nome,
      "email": email,
    };
    await db.collection("pessoas").add(pessoa);
  }

  void limparCampos() {
    nome.clear();
    email.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Login Teste'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                    email.text,
                  );
                  limparCampos();
                },
                child:const Text("Gravar dados"),
              ),
              ElevatedButton(onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
              }, child: const Text("Listar dados")),
            ],
          ),
        ),
      ),
    );
  }
}