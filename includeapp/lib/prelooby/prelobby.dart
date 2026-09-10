import 'package:flutter/material.dart';
import 'package:includeapp/prelooby/inputLogin.dart';
import 'package:just_bubble/just_bubble.dart';

class Prelobby extends StatefulWidget {
  const Prelobby({super.key});

  @override
  State<Prelobby> createState() => _PrelobbyState();
}

class _PrelobbyState extends State<Prelobby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Prelobby", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final telaWidth = constraints.maxWidth;
            final telaHeight = constraints.maxHeight;
            final telaPC = telaWidth > 600;

            final double pessoaWidth = telaPC ? telaWidth * 0.22 : telaWidth * 0.55;
            final double pessoaEsquerdo = telaPC ? telaWidth * 0.3125 : telaWidth * 0.10;
            final double pessoaTop = telaPC ? telaHeight * 0.15 : telaHeight * 0.25;
            final double fontSizeBalao = telaPC ? telaWidth * 0.015 : telaWidth * 0.045;
            final double fontSizeElevated = telaPC ? telaWidth * 0.02 : telaWidth * 0.07;
            final double botaoPadding = telaPC ? telaWidth * 0.0075 : telaHeight * 0.015;
            final double balaoTop = telaPC ? telaHeight * 0.13 : telaHeight * 0.15;
            final double balaoEsquerda = telaPC ? telaWidth * 0.46 : telaWidth * 0.45;
            final double balaoDireito = telaPC ? telaWidth * 0.32 : telaWidth * 0.16;

            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: pessoaEsquerdo,
                        top: pessoaTop,
                        child: Image.asset(
                          "assets/imagem/login/MeninoBemVindo2.png",
                          width: pessoaWidth,
                        ),
                      ),
                      Positioned(
                        left: balaoEsquerda,
                        top: balaoTop,
                        right: balaoDireito,
                        child: Bubble(
                          padding: const EdgeInsets.all(12),
                          color: Colors.white,
                          border: BubbleBorder(
                            tail: Tail.triangle(tailJoin: TailJoin.sharp),
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
                  padding: EdgeInsets.only(bottom: botaoPadding),
                  child: SizedBox(
                    width: telaWidth * 0.8,
                    height: telaHeight * 0.065,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const Inputlogin()),
                        );
                      },
                      child: Text(
                        "Continuar",
                        style: TextStyle(fontSize: fontSizeElevated),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}