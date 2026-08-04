import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/jogos/nivelUm.dart';
import 'package:includeapp/jogos/nivelZero.dart';
import 'package:includeapp/prelooby/prelobby.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'jogos/nivelDois.dart';

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

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Prelobby()));
    }

    return Scaffold(
      appBar: appBarWidget(context, "Inicial", widget.nome),
      drawer: drawerFazer(context, widget.nome),

        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Text("Bem-vindo, ${widget.nome}!"),
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
                              borderRadius: BorderRadius.circular(60)
                            ),
                          ),
                          onPressed: () {
                            alertDialogAjuda(context);
                          }, child: Icon(Icons.live_help_outlined, size: 50,)),
                    ),
                           
                      SizedBox(height: 10),

                      Text("Ajuda?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),

                      SizedBox(height: 20),

                       ElevatedButton(onPressed: efetuarLogoff, child: Text('Logoof')),

                      SizedBox(height: 20),
                    ],
                  ),
                ],
              );
            }
          )
        ),
    );
  }
}