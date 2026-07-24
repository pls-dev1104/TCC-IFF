import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_bubble/just_bubble.dart';
import 'inicial.dart';

class Prelobby extends StatefulWidget {
  const Prelobby({super.key});

  @override
  State<Prelobby> createState() => _PrelobbyState();
}

class _PrelobbyState extends State<Prelobby> {
TextEditingController nomeUs = TextEditingController();

 Future<void> salvar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("usuario", nomeUs.text);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => Inicial(nome: nomeUs.text)),
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Prelobby")),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final telaWidth = constraints.maxWidth;
            final telaHeight = constraints.maxHeight;

            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: telaWidth * 0.12,
                        bottom: 0,
                        top: telaHeight * 0.1,
                        child: Image.asset(
                          "assets/imagem/MeninoIncludeAPP.png",
                          width: telaWidth * 0.40,
                        ),
                      ),

                      Positioned(
                        left: telaWidth * 0.45,
                        top: telaHeight * 0.22,
                        right: telaWidth * 0.16,
                        child: Bubble(
                          padding: EdgeInsets.all(12),
                          color: Colors.white,
                          border: BubbleBorder(
                            tail: Tail.triangle(
                              tailJoin: TailJoin.sharp,
                            ),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            width: 2,
                          ),
                          child: Text(
                            "Olá, seja muito bem-vindo ao IncludeAPP", 
                            style: TextStyle(fontSize: telaWidth * 0.045), 
                          ),
                        ),
                      )
                    ],
                  ), 
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: telaHeight * 0.015),
                  child: SizedBox(
                    width: telaWidth * 0.8,
                    height: telaHeight * 0.065,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white
                      ),
                      onPressed: () {
                    }, child: Text("Continuar", style: TextStyle(fontSize: telaWidth * 0.07),)),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
