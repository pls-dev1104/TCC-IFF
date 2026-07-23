import 'package:flutter/material.dart';
import 'package:includeapp/nivelUm.dart';
import 'package:includeapp/nivelZero.dart';
import 'package:includeapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'nivelDois.dart';

class Inicial extends StatefulWidget {
  final String nome;

  const Inicial({super.key, required this.nome});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {

  @override
  Widget build(BuildContext context) {
    Future<void> efetuarLogoff() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove("usuario");
    
      if (!context.mounted) return;

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Principal())
        );
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, title: Text("Tela Inicial")),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("Bem-vindo, ${widget.nome}!"),
              Text("Jogos Educacionais"),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 180,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(30)
                              )
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NivelZero()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Nível 0", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                                const Text("Apps básicos do celular"),
                              ],
                            )
                          ),
                        ),

                        SizedBox(height: 30),

                        SizedBox(
                          width: 200,
                          height: 180,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(30)
                              )
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NivelUm()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Nível 1", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                                const Text("Conversar e Instalar"),
                              ],
                            ) 
                          ),
                        ),

                        SizedBox(height: 30),

                        SizedBox(
                          width: 200,
                          height: 180,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(30)
                              )
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NivelDois()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Nível 2", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                                const Text("Navegar e Participar"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: Text("Mapa do conhecimento"),
                          content: SizedBox(
                            width: 160,
                            height: 410,
                            child: Column(
                              children: [
                                Text("Este local tem o intuito de ser o lugar você aprenderá a usar o celular de forma divertida por meio de minijogos.\n", style: TextStyle(fontSize: 16)),
                                Column(
                                  children: [
                                    Text("Nível 0:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    Text("você aprenderá a criar um alarme, salvar o contato de alguém, chamadas e muito mais.\n"),

                                    Text("Nível 1:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    Text("você aprenderá a criar um email, instalação de apps, whatsapp e etc.\n"),

                                    Text("Nível 2:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    Text("você aprenderá a navegar na internet, login em apps, mexer no youtube, além de outras coisas.\n")
                                  ],
                                )
                              ],
                            ),
                          ),
                          actions: [
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }, 
                                child: Text("Voltar", style: TextStyle(fontSize: 16))),
                            ),                        
                          ],
                        ));
                    }, child: Icon(Icons.live_help_outlined, size: 50,)),
              ),

              SizedBox(height: 10),

              Text("Ajuda?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), ),
            ],
          ),
        ),
    );
  }
}