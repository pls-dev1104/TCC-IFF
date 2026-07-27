import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:includeapp/prelobby.dart';
import 'package:just_bubble/just_bubble.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'inicial.dart';

class PreLobbyUltimo extends StatefulWidget {
  const PreLobbyUltimo({super.key});

  @override
  State<PreLobbyUltimo> createState() => _PreLobbyUltimoState();
}

class _PreLobbyUltimoState extends State<PreLobbyUltimo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prelobby", style: TextStyle(color: Colors.white)), centerTitle: true,),
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
              pessoaEsquerdo = telaWidth * 0.32;
              pessoaTop = telaHeight * 0.05;
              fontSizeBalao = telaWidth * 0.015;
              fontSizeElevated = telaWidth * 0.02;
              botaoPadding = telaWidth * 0.0075;
              balaoTop = telaHeight * 0.12;
              balaoEsquerda = telaWidth * 0.48;
              balaoDireito = telaWidth * 0.355;
            } else {
              pessoaWidth = telaWidth * 0.40;
              pessoaEsquerdo = telaWidth * 0.10;
              pessoaTop = telaHeight * 0.1;
              fontSizeBalao = telaWidth * 0.036;
              fontSizeElevated = telaWidth * 0.07;
              botaoPadding = telaHeight * 0.015;
              balaoTop = telaHeight * 0.20;
              balaoEsquerda = telaWidth * 0.45;
              balaoDireito = telaWidth * 0.115;
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
                          "assets/imagem/MeninoUltimoPreLobby.png",
                          width: pessoaWidth,
                        ), 
                      ),

                      Positioned(
                        child: Bubble(
                          child: Text(""),
                        ),
                      ),
                    ],
                  )
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => PreLobbyUltimo()));
                      }, 
                      child: Text("Continuar", style: TextStyle(fontSize: fontSizeElevated),)),
                  ),
                )
              ],
            );
          }),
      ),
    );
  }
}