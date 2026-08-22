import 'package:flutter/material.dart';
import 'package:includeapp/%20funcoes_widgets/widgets.dart';
import 'package:includeapp/jogos/nivel1/etapa2Chamada.dart';

class Etapa1Chamada extends StatefulWidget {
  final String nome;

  const Etapa1Chamada({super.key, required this.nome});

  @override
  State<Etapa1Chamada> createState() => _Etapa1Chamada();
}

class _Etapa1Chamada extends State<Etapa1Chamada> {
  bool botao1 = false;
  bool botao2 = false;
  bool botao3 = false;
  bool botao4 = false;

  bool escolhaCerta1 = true;
  bool escolhaCerta2 = false;
  bool escolhaCerta3 = false;
  bool escolhaCerta4 = false;

  final imagem = "assets/imagem/jogosImagem/level1/telaInicialChamada.jpg";
  final pergunta = "Onde devo clicar para entrar na tela de discar?";
  final opcao1 = Icon(Icons.dialpad, size: 30);
  final opcao2 = Icon(Icons.home_filled, size: 30);
  final opcao3 = Icon(Icons.person_add_alt, size: 30);
  final opcao4 = Icon(Icons.menu, size: 30,);

  void Erro1() {
    setState(() {
      botao1 = true;
    });
  }

  void Erro2() {
    setState(() {
      botao2 = true;
    });
  }

  void Erro3() {
    setState(() {
      botao3 = true;
    });
  }

  void Erro4() {
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
      appBar: appBarWidget(context, "Etapa 1", widget.nome),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final telaWidth = MediaQuery.of(context).size.width;
            final telaHeigth = MediaQuery.of(context).size.height;

            return padronizacaoJogo(context, widget.nome, imagem, pergunta, (context) => Etapa2Chamada(nome: widget.nome), telaWidth, telaHeigth, botao1, botao2, botao3, botao4, escolhaCerta1, escolhaCerta2, escolhaCerta3, escolhaCerta4, Erro1, Erro2, Erro3, Erro4, opcao1, opcao2, opcao3, opcao4);
          },
        ),
      ),
    );
  }
}