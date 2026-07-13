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
        appBar: AppBar(
          centerTitle: true, title: Text("Tela Inicial")),
        body: Center(
          child: Column(
            children: [
              Text("Bem-vindo, ${widget.nome}!"),
              Text("Jogos Educacionais"),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Celular()));
                    }, child: const Icon(Icons.phone_android, color: Colors.white),
                  ),
                
                  SizedBox(height: 80, width: 40),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Computador()));
                    }, child: const Icon(Icons.computer, color: Colors.white)
                  )
                ]
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Celular()));
                    }, child: const Icon(Icons.warning, color: Colors.white,)
                  ),

                  SizedBox(width: 40),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Computador()));
                    }, child: const Icon(Icons.home, color: Colors.white,))
                ],
              ),
            ],
          ),
        ),
    );
  }
}