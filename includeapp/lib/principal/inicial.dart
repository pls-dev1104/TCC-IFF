import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/jogos/nivel0/etapa0Chamada.dart';
import 'package:includeapp/jogos/nivel1/etapa1Chamada.dart';
import 'package:includeapp/jogos/nivel2/etapa1Alarme.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class Inicial extends StatefulWidget {

  const Inicial({super.key});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {

  String nomeUsuario = '';

  @override
  void initState() {
    super.initState();
    _carregarNomeUsuario(); // Busca o nome assim que a tela abre
  }

  Future<void> _carregarNomeUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Pega a string salva na chave "usuario" ou usa "Visitante" como padrão se for nulo
      nomeUsuario = prefs.getString("usuario") ?? "Visitante"; 
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Inicial", nomeUsuario),
      drawer: drawerFazer(context),

      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(height: 20),
                Text("Bem-vindo, $nomeUsuario!"),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
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
                                  borderRadius: BorderRadiusGeometry.circular(
                                    30,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: ((context) => Etapa0Chamada()))
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Nível 0",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text("Apps básicos do celular"),
                                ],
                              ),
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
                                  borderRadius: BorderRadiusGeometry.circular(
                                    30,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Etapa1Chamada()
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Nível 1",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text("Conversar e Instalar"),
                                ],
                              ),
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
                                  borderRadius: BorderRadiusGeometry.circular(
                                    30,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Etapa1Alarme(),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Nível 2",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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

                Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Etapa1Alarme(),
                            ),
                          );
                        },
                        child: Icon(Icons.live_help_outlined, size: 50),
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Ajuda?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
