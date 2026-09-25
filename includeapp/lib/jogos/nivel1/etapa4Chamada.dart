import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/jogos/nivel1/etapa5Chamada.dart';

class Etapa4Chamada extends StatefulWidget {

  const Etapa4Chamada({super.key});

  @override
  State<Etapa4Chamada> createState() => _Etapa4Chamada();
}

class _Etapa4Chamada extends State<Etapa4Chamada> {
  bool botao1 = false;
  bool botao2 = false;
  bool botao3 = false;
  bool botao4 = false;

  bool escolhaCerta1 = false;
  bool escolhaCerta2 = false;
  bool escolhaCerta3 = true;
  bool escolhaCerta4 = false;

  final imagem = "assets/imagem/jogosImagem/level1/TelaDrowerChamada.jpg";
  final pergunta = "Qual desses 4 devo apertar para \nentrar na aba de contatos?";
  final opcao1 = Icon(Icons.replay, size: 30);
  final opcao2 = Icon(Icons.settings_outlined, size: 30);
  final opcao3 = Icon(Icons.group, size: 30);
  final opcao4 = Icon(Icons.help_outline_outlined, size: 30,);

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
      appBar: appBarWidgetMiniJogo(context, "Etapa 4"),
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final telaWidth = MediaQuery.of(context).size.width;

              final telaPC = telaWidth > 600;
              final double imagemTela;
              final int cacheImagemTela;

              if (telaPC) {
                imagemTela = telaWidth * 0.15;
                cacheImagemTela = 400;
              } else {
                imagemTela = telaWidth * 0.55;
                cacheImagemTela = 900;
              }

              return padronizacaoJogo(context, imagem, pergunta, (context) => Etapa5Chamada(), imagemTela, cacheImagemTela, telaPC, botao1, botao2, botao3, botao4, escolhaCerta1, escolhaCerta2, escolhaCerta3, escolhaCerta4, erro1, erro2, erro3, erro4, opcao1, opcao2, opcao3, opcao4);
            },
          ),
        )
      ), 
    );
  }
}