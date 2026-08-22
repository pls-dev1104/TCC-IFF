import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';

class Etapa1Chamada extends StatefulWidget {
  final String nome;

  const Etapa1Chamada({super.key, required this.nome});

  @override
  State<Etapa1Chamada> createState() => _Etapa1Chamada();
}

class _Etapa1Chamada extends State<Etapa1Chamada> {

  var botaoCerto = false;
  var botaoErro1 = false;
  var botaoErro2 = false;
  var botaoErro3 = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, "Nível 1", widget.nome),
      drawer: drawerFazer(context, widget.nome),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final telaWidth = MediaQuery.of(context).size.width;
            final telaHeigth = MediaQuery.of(context).size.height;
            

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  width: telaWidth * 0.30,
                  height: telaHeigth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(top: 20),
                        child: Image.asset(
                          "assets/imagem/jogosImagem/level1/telaInicialChamada.jpg",
                          width: 285,
                          ),
                        ),

                      Padding(
                        padding: EdgeInsetsGeometry.only(top: 30),
                        child: Text("Onde devo clicar para entrar na tela de discar?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      ),

                      Padding(
                        padding: EdgeInsetsGeometry.only(top: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: VerificacaoBotao(botaoCerto),
                              onPressed: () {
                                acerto(context, widget.nome);
                              },
                              child: Text("1", style: TextStyle(
                              fontSize: 22
                            ),)),

                            ElevatedButton(
                              style: VerificacaoBotao(botaoErro1),
                              onPressed: () {
                                setState(() {
                                  botaoErro1 = true;
                                });
                              }, 
                              child: Text("2", style: TextStyle(
                              fontSize: 22
                            ),)),

                            ElevatedButton(
                              style: VerificacaoBotao(botaoErro2),
                              onPressed: () {
                                setState(() {
                                  botaoErro2 = true;
                                });
                              }, 
                              child: Text("3", style: TextStyle(
                              fontSize: 22
                            ),)),

                            ElevatedButton(
                              style: VerificacaoBotao(botaoErro3),
                              onPressed: () {
                                setState(() {
                                  botaoErro3 =true;
                                });
                              }, 
                              child: Text("4", style: TextStyle(
                              fontSize: 22
                            ),)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}