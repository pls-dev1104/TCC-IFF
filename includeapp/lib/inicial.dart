import 'package:flutter/material.dart';
import 'package:includeapp/celular.dart';
import 'package:includeapp/computador.dart';

class Inicial extends StatefulWidget {
  final String nome;

  const Inicial({super.key, required this.nome});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Tela Inicial")),
        body: Center(
          child: Column(
            children: [
              Text("Bem-vindo , ${widget.nome}!"),
              Text("Jogos Educacionais"),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Celular()));
              }, child: const Text("Celular")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Computador()));
              }, child: const Text("Computador"))
            ],
          ),
        ),
    );
  }
}