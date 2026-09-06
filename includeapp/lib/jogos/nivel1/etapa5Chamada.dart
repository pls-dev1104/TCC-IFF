import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/funcoes.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/jogos/nivel1/etapa2Chamada.dart';
import 'package:includeapp/jogos/nivel1/etapa6Chamada.dart';

class Etapa5Chamada extends StatefulWidget {

  const Etapa5Chamada({super.key});

  @override
  State<Etapa5Chamada> createState() => _Etapa5Chamada();
}

class _Etapa5Chamada extends State<Etapa5Chamada> {
  bool botao1 = false;
  bool botao2 = false;
  bool botao3 = false;
  bool botao4 = false;

  bool escolhaCerta1 = false;
  bool escolhaCerta2 = true;
  bool escolhaCerta3 = false;
  bool escolhaCerta4 = false;

  final imagem = "assets/imagem/jogosImagem/level1/telaContatosChamadas.jpg";
  final pergunta = "Onde devo apertar para criar \num novo contato?";
  final opcao1 = Icon(Icons.person, size: 30);
  final opcao2 = Text("Criar contato", style: TextStyle(fontSize: 18),);
  final opcao3 = Icon(Icons.share_rounded, size: 30,);
  final opcao4 = Text("Compartilhar", style: TextStyle(fontSize: 18),);

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
      appBar: appBarWidgetMiniJogo(context, "Etapa 5"),
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final telaWidth = MediaQuery.of(context).size.width;
              final telaHeight = MediaQuery.of(context).size.height;

              final telaPC = telaWidth > 600;
              final double borderWidth;
              final double borderHeight;
              final double imagemTela;
              final int cacheImagemTela;

              if (telaPC) {
                borderWidth = telaWidth * 0.30;
                borderHeight = telaHeight * 0.875;
                imagemTela = telaWidth * 0.13;
                cacheImagemTela = 400;
              } else {
                borderWidth = telaWidth * 0.9;
                borderHeight = telaHeight * 0.85;
                imagemTela = telaWidth * 0.50;
                cacheImagemTela = 200;
              }

              return padronizacaoJogo(context, nomeUsuario, imagem, pergunta, (context) => Etapa6Chamada(), borderWidth, borderHeight, imagemTela, cacheImagemTela, telaPC, botao1, botao2, botao3, botao4, escolhaCerta1, escolhaCerta2, escolhaCerta3, escolhaCerta4, erro1, erro2, erro3, erro4, opcao1, opcao2, opcao3, opcao4);
            },
          ),
        )
      ), 
    );
  }
}