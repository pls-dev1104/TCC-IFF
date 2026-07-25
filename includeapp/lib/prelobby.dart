import 'package:flutter/material.dart';
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
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final telaWidth = constraints.maxWidth;
            final telaHeight = constraints.maxHeight;
            final telaPC = telaWidth > 600;
            double pessoaWidth;
            double pessoaEsquerdo;
            double pessoaTop;
            double fontSizeBalao;
            double fontSizeElevated;
            double botaoPadding;
            double balaoTop;
            double balaoEsquerda;
            double balaoDireito;

            if (telaPC) {
              pessoaWidth = telaWidth * 0.2;
              pessoaEsquerdo = telaWidth * 0.30;
              pessoaTop = telaHeight * 0.05;
              fontSizeBalao = telaWidth * 0.015;
              fontSizeElevated = telaWidth * 0.02;
              botaoPadding = telaWidth * 0.0075;
              balaoTop = telaHeight * 0.18;
              balaoEsquerda = telaWidth * 0.46;
              balaoDireito = telaWidth * 0.32;
            } else {
              pessoaWidth = telaWidth * 0.40;
              pessoaEsquerdo = telaWidth * 0.10;
              pessoaTop = telaHeight * 0.1;
              fontSizeBalao = telaWidth * 0.045;
              fontSizeElevated = telaWidth * 0.07;
              botaoPadding = telaHeight * 0.015;
              balaoTop = telaHeight * 0.22;
              balaoEsquerda = telaWidth * 0.45;
              balaoDireito = telaWidth * 0.16;
            }

            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: pessoaEsquerdo,
                        bottom: 0,
                        top: pessoaTop,
                        child: Image.asset(
                          "assets/imagem/MeninoIncludeAPP.png",
                          width: pessoaWidth,
                        ),
                      ),

                      Positioned(
                        left: balaoEsquerda,
                        top: balaoTop,
                        right: balaoDireito,
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
                            style: TextStyle(fontSize: fontSizeBalao), 
                          ),
                        ),
                      )
                    ],
                  ), 
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: botaoPadding),
                  child: SizedBox(
                    width: telaWidth * 0.8,
                    height: telaHeight * 0.065,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white
                      ),
                      onPressed: () {
                    }, child: Text("Continuar", style: TextStyle(fontSize: fontSizeElevated),)),
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
