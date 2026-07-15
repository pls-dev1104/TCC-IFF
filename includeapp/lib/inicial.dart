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
              SizedBox(height: 20),
              Text("Bem-vindo, ${widget.nome}!\n"),
              Text("Esta é a sua página de Jogos Educativos.\nAqui, nós guardamos vários minijogos onde\nvocê pode passar o tempo e aprender novas\ncoisas sobre como usar estes aparelhos"),
              SizedBox(height: 120),

              Container(
                width: 450,
                height: 400,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            fixedSize: Size(140, 120),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20)
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Celular()));
                          }, 
                          child: const Icon(Icons.phone_android, size: 65)),

                          SizedBox(height: 80, width: 100),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            fixedSize: Size(140, 120),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20)
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Computador()));
                          }, 
                          child: const Icon(Icons.computer_sharp, size: 65)),
                      ],
                     ),

                    SizedBox(height: 80),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            fixedSize: Size(140, 120),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20)
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Celular()));
                          }, 
                          child: const Icon(Icons.message_rounded, size: 65)),

                          SizedBox(height: 80, width: 100),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            fixedSize: Size(140, 120),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20)
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Computador()));
                          }, 
                          child: const Icon(Icons.email_outlined, size: 65)),
                      ],
                     ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}