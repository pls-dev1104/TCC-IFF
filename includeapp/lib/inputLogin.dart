import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_bubble/just_bubble.dart';
import 'inicial.dart';

class Inputlogin extends StatefulWidget {
  const Inputlogin({super.key});

  @override
  State<Inputlogin> createState() => _InputloginState();
}

class _InputloginState extends State<Inputlogin> {
TextEditingController nomeUs = TextEditingController();

  Future<void> salvar() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("usuario", nomeUs.text);

  if (!mounted) return;

    String nome = nomeUs.text;

    if (nome.isEmpty){
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => Inicial(nome: nomeUs.text)),
    );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Prelobby", style: TextStyle(color: Colors.white),)),
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
              pessoaWidth = telaWidth * 0.15;
              pessoaEsquerdo = telaWidth * 0.32;
              pessoaTop = telaHeight * 0.08;
              fontSizeBalao = telaWidth * 0.015;
              fontSizeElevated = telaWidth * 0.02;
              botaoPadding = telaWidth * 0.0075;
              balaoTop = telaHeight * 0.12;
              balaoEsquerda = telaWidth * 0.48;
              balaoDireito = telaWidth * 0.355;
            } else {
              pessoaWidth = telaWidth * 0.40;
              pessoaEsquerdo = telaWidth * 0.10;
              pessoaTop = telaHeight * 0.10;
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
                          "assets/imagem/MeninoInputNome.png",
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
                                  tailJoin: TailJoin.sharp
                                ),
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                                width: 2
                              ),
                              child: Column(
                                children: [
                                  Text("Meu nome é Rogério. Qual seu nome?", style: TextStyle(fontSize: fontSizeBalao),),

                                  TextField(
                                   controller: nomeUs,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: fontSizeBalao),
                                  ),
                                ],
                              ),
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
                      onPressed: salvar, 
                      child: Text("Continuar", style: TextStyle(fontSize: fontSizeElevated),)),
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