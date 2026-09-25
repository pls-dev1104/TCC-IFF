import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/jogos/nivel1/etapa3Chamada.dart';

class Etapa2Chamada extends StatefulWidget {

  const Etapa2Chamada({super.key});

  @override
  State<Etapa2Chamada> createState() => _Etapa2ChamadaState();
}

class _Etapa2ChamadaState extends State<Etapa2Chamada> {
  bool botao1 = false;
  bool botao2 = false;
  bool botao3 = false;
  bool botao4 = false;

  bool escolhaCerta1 = false;
  bool escolhaCerta2 = true;
  bool escolhaCerta3 = false;
  bool escolhaCerta4 = false;

  final imagem = "assets/imagem/jogosImagem/level1/telaDiscarNumero.jpg";
  final pergunta = "Depois de digitar o número, qual botão devo apertar para realizar a chamada?";
  final opcao1 = Icon(Icons.home_filled, size: 30);
  final opcao2 = Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.call, size: 25,),
      SizedBox(width: 5,),
      Text("Ligar", style: TextStyle(fontSize: 25),)
    ],
  );
  final opcao3 = Icon(Icons.backspace_outlined, size: 30);
  final opcao4 = Icon(Icons.grid_3x3, size: 30);


  void erro1() {
    setState(() {
      botao1 = true;
    });
  }

  void erro2() {
    setState(() {
      botao2 = true;
    });
  }

  void erro3() {
    setState(() {
      botao3 = true;
    });
  }

  void erro4() {
    setState(() {
      botao4 = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetMiniJogo(context, "Fase 2"),
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final telaWidth = MediaQuery.of(context).size.width;

              final telaPC = telaWidth > 600;
              final double imagemTela;
              final int cacheImagemTela;

              if (telaPC) {
                imagemTela = telaWidth * 0.125;
                cacheImagemTela = 400;
              } else {
                imagemTela = telaWidth * 0.60;
                cacheImagemTela = 900;
              }

              return padronizacaoJogo(context, imagem, pergunta, (context) => Etapa3Chamada(), imagemTela, cacheImagemTela, telaPC, botao1, botao2, botao3, botao4, escolhaCerta1, escolhaCerta2, escolhaCerta3, escolhaCerta4, erro1, erro2, erro3, erro4, opcao1, opcao2, opcao3, opcao4);
            },
          ),
        )
      ), 
    );
  }
}